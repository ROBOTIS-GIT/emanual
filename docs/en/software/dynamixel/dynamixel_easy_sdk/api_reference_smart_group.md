---
layout: archive
lang: en
ref: api_reference_smart_group
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_easy_sdk/api_reference_smart_group/
tabs: "Languages"
tab_title1: Python
tab_title2: C++
sidebar:
  title: DYNAMIXEL Easy SDK
  nav: "dynamixel_easy_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="smart-group-reference">SmartGroup Class Reference</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

- SmartGroup classes (`SmartGroupReader` / `SmartGroupWriter`) provide an intelligent way to manage multiple DYNAMIXEL motors.
- They automatically determine the most efficient communication method (Sync vs Bulk) based on the requested addresses and lengths.
- These classes are typically created via `Connector.createReader()` and `Connector.createWriter()`.

<section data-id="{{ page.tab_title1 }}" class="tab_contents">

## SmartGroupReader

**Methods**

| Method | Return Type | Description |
|---|---|---|
| add(id, item_name, key="") | SmartGroupReader | Adds a motor to the read queue using Control Table item name. |
| add(id, address, length, key="") | SmartGroupReader | Adds a motor to the read queue using address and length. |
| read() | None | Executes the read operation. |
| get(key) | Int | Retrieves the read data associated with the key. |
| clear() | None | Clears the request queue and cached data. |

**Example**
```python
reader = connector.createReader()
reader.add(1, "Present_Position", "pos1")
reader.add(2, "Present_Position", "pos2")
reader.read()
print(reader.get("pos1"))
```

## SmartGroupWriter

**Methods**

| Method | Return Type | Description |
|---|---|---|
| add(id, item_name, data) | SmartGroupWriter | Adds a motor to the write queue using Control Table item name. |
| add(id, address, length, data) | SmartGroupWriter | Adds a motor to the write queue using address and length. |
| write(values=None) | None | Executes the write operation. Optionally updates values before writing. |
| clear() | None | Clears the request queue. |

**Example**
```python
writer = connector.createWriter()
writer.add(1, "Goal_Position", 500)
writer.add(2, "Goal_Position", 500)
writer.write()

# Update values and write again
writer.write([1000, 1000]) 
```

</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">

## SmartGroupReader

**Methods**

| Method | Return Type | Description |
|---|---|---|
| add(uint8_t id, const std::string& item_name, const std::string& key) | SmartGroupReader& | Adds a motor to the read queue using Control Table item name. |
| add(uint8_t id, uint16_t addr, uint16_t len, const std::string& key) | SmartGroupReader& | Adds a motor to the read queue using address and length. |
| read() | std::pair<ReadResult, Status> | Executes the read operation. Returns result and status. |
| clear() | void | Clears the request queue. |

**ReadResult Structure**
- `get<T>(uint8_t id, const std::string& key)`: Returns `std::optional<T>`.
- `values`: Vector of all read values in request order.

**Example**
```cpp
auto reader = connector->createReader();
reader->add(1, "Present_Position", "pos1");
reader->add(2, "Present_Position", "pos2");

auto [result, status] = reader->read();
if (status.success) {
    auto pos1 = result.get<int32_t>(1, "pos1");
    // ...
}
```

## SmartGroupWriter

**Methods**

| Method | Return Type | Description |
|---|---|---|
| add(uint8_t id, const std::string& item_name, T data) | SmartGroupWriter& | Adds a motor to the write queue using Control Table item name. |
| add(uint8_t id, uint16_t addr, T data) | SmartGroupWriter& | Adds a motor to the write queue using address and length. |
| write_or_throw() | WriteStatus | Executes the write operation. Throws DxlError on failure. |
| write(const std::vector<int32_t>& values) | WriteStatus | Updates values and executes write operation. |
| clear() | void | Clears the request queue. |

**Example**
```cpp
auto writer = connector->createWriter();
writer->add(1, "Goal_Position", 500);
writer->add(2, "Goal_Position", 500);
writer->write_or_throw();

// Update values and write again
writer->write({1000, 1000});
```

</section>
