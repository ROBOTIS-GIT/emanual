
$(document).ready(function() {
  var search_item;

  $("#search-form").submit(function(event) {
    search_item = $("#search_term").val();
    // console.log(search_item);
    if(search_item == '') {
      alert("Please enter the search term");
    }
    else {
      emanual_search(search_item);
    }
    event.preventDefault();
  });
});

function toggle_search_window() {
  if (toggle_search_result == 0) {
    $('.search-result').css('display', 'block');
    toggle_search_result = 1;
  }
  else {
    $('.search-result').css('display', 'none');
    toggle_search_result = 0;
  }
}

function emanual_search(search_item) {
  // Implmentation for Local search engine with JSON file
  // var elasticlunr = require('elasticlunr');
  var index = elasticlunr(function () {
    this.addField('product');
    this.addField('header1');
    this.addField('header2');
    this.addField('header3');
    this.addField('content');
    this.addField('url');
    this.setRef('id');
  });
  
  var search_result_contents = '';

  $.getJSON('/search_index.json', function(idx) {
    // var search_item = document.getElementById("search_term").textContent;
    $.each(idx, function(v){
      var doc = {
        id: v,
        product: idx[v].product,
        header1: idx[v].header1,
        header2: idx[v].header2,
        header3: idx[v].header3,
        content: idx[v].content,
        url: idx[v].url
      }
      index.addDoc(doc);
    })
    // console.log(index);
    
    var results = index.search(search_item, {
        fields: {
            product: {boost: 1},
            header1: {boost: 0.7},
            header2: {boost: 0.5},
            header3: {boost: 0.3},
            content: {boost: 0.1},
        }
    });
    
    // console.log(results.length);  
    search_result_contents += '<div style="color:black; font-weight:600; font-size:1.2em; text-align:left;">' + "Search results for \"" + search_item + "\"" + '</div>';
    if (results.length > 0) {
      var i = 0;
      search_result_contents += '<i class="fa fa-times fa-2x" aria-hidden="true" onclick=toggle_search_window() style="position:fixed;"></i>' + '<br>' + '<ol style=text-align:left;font-size:0.9em;>';
      for (i = 0; i < results.length; i++) {
        var result_doc = index.documentStore.getDoc(results[i].ref);
        var result_score = results[i].score;
        if (result_doc.content != '') {
          var result_content = jQuery.trim(result_doc.content).substring(0, 200).split(" ").slice(0, -1).join(" ") + "...";
        }
        else {
          var result_content = "N/A";
        }
        // console.log(results);
        
        search_result_contents += '<li>' + "Score : " + result_score + '<br>';
        search_result_contents += "Location: " + '<a href="' + result_doc.url + '" onclick=toggle_search_window()>' + result_doc.product + " / " + result_doc.header1;
        if (result_doc.header2 != '') {
          search_result_contents += " / " + result_doc.header2;
        }
        if (result_doc.header3 != '') {
          search_result_contents += " / " + result_doc.header3;
        }
        search_result_contents += '</a></li>';
        search_result_contents += '<div style="font-style:italic">' + result_content + '</div>' + '<br>';
      }
      search_result_contents += '</ol>'
    }
    else {
      search_result_contents += '<i class="fa fa-times fa-2x" aria-hidden="true" onclick=toggle_search_window() style="position:fixed;"></i>' + '<br><br>' + '<div style="color:red; font-weight:600; font-size:1em; text-align:left;">' + "No Result Found" + '</div>';
      // console.log("No Results Found.");
    }
    toggle_search_window();
    $('.search-result').html(search_result_contents);
  });
}
