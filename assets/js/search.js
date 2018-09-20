
$(document).ready(function() {
  var search_item;

  $("#search-form").submit(function(event) {
    search_item = $("#search_term").val();
    console.log("Form submitted");
    console.log(search_item);
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
            content: {}
        }
    });
    
    console.log(results.length);  
    if (results.length > 0) {
      var i = 0;
      search_result_contents += '<i class="fa fa-times fa-2x" aria-hidden="true" onclick=toggle_search_window()></i>' + '<br>' + '<ul style=text-align:left;>';
      for (i = 0; i < results.length; i++) {
        var result_doc = index.documentStore.getDoc(results[i].ref);
        console.log(result_doc.url);
        
        search_result_contents += '<li>' + '<a href=' + result_doc.url + '>' + result_doc.product + " > " + result_doc.header1;
        if (result_doc.header2 != '') {
          search_result_contents += " > " + result_doc.header2;
        }
        if (result_doc.header3 != '') {
          search_result_contents += " > " + result_doc.header3;
        }
        search_result_contents += '</a></li>';
      }
      search_result_contents += '</ul>'
    }
    else {
      search_result_contents += '<i class="fa fa-times fa-2x" aria-hidden="true" onclick=toggle_search_window()></i>' + '<br><br>' + '<div style="color:red; font-weight:600; font-size:1.5em; text-align:left;">' + "No Results Found with \"" + search_item + "\"" + '</div>';
      console.log("No Results Found.");
    }
    toggle_search_window();
    $('.search-result').html(search_result_contents);
  });
}
