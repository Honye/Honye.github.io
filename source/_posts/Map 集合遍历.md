---
title: 遍历 Map 的四种方法
tags:
  - Java
abbrlink: 6fa78ea3
date: 2017-03-21 11:07:19
---

**1. 通过 Map.keySet 遍历 key 和 value，二次取值（常用）**

```java
for ( String key : map.keySet() ) {
    System.out.println( "key = " + key +" and value = " + map.get( key ) );
}
```

**2. 通过 Map.entrySet 使用 iterator 遍历 key 和 value**

```java
Iterator<Map.Entry<String, String>> it = map.entrySet().iterator();
while ( it.hasNext() ) {
    Map.Entry<String, String> entry = it.next();
    System.out.println( "key = " + entry.getKey() + " and value = " + entry.getValue() );
}
```

**3. 通过 Map.entrySet 遍历 key 和 value（推荐，尤其容量大的时候）**

```java
for ( Map.Entry<String, String> entry : map.entrySet() ) {
    System.out.println( "key = " + entry.getKey() + " and value = " + entry.getValue() );
}
```

**4. 通过 Map.values() 遍历所有的 value，但不能遍历 key**

```java
for ( String v : map.values() ) {
    System.out.println( "value = " + v );
}
```