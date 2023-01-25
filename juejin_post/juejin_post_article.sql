create table article
(
	id           int auto_increment
		primary key,
	title        varchar(255)         not null,
	author       varchar(30)          not null,
	cover        varchar(255)         null,
	brief        varchar(100)         not null comment '文章摘要',
	state        varchar(6)           null,
	category     int                  not null,
	watch_num    int        default 0 null comment '观看数',
	gmt_modified datetime             null on update CURRENT_TIMESTAMP,
	gmt_created  datetime             null,
	is_delete    tinyint(1) default 0 not null,
	content      text                 null
)
	collate = utf8_unicode_ci;

create index aahs
	on article (category);

create index sdf
	on article (author);

INSERT INTO juejin_post.article (id, title, author, cover, brief, state, category, watch_num, gmt_modified, gmt_created, is_delete, content) VALUES (1, 'ES6 - 解构赋值', 'ken200461', null, '## 对象解构 对象的解构赋值在花括号内写需要解构属性的key，可以在冒号后重命名，也可以在等号后给值为undefined的属性赋初始值 ```js const obj = { name: ', '审核中', 2, 0, '2023-01-25 17:15:51', '2023-01-25 18:05:41', 0, '## 对象解构

对象的解构赋值在花括号内写需要解构属性的key，可以在冒号后重命名，也可以在等号后给值为undefined的属性赋初始值

```js
const obj = {
  name: ''guo'',
  age: 18,
  school: undefined,
  address: ''ShangHai''
}

const { name, age } = obj
console.log(name, age)  //guo 18

const { school: schoolName = ''SSPU'' } = obj
console.log(schoolName)   //SSPU
```

应用：引入的库或网络请求返回的结果提取需要的内容



## 数组解构

数组按照元素的顺序进行解构，可以留空跳过元素

```js
const arr = [1, 2, 3, 4, 5]
const [x, y, z] = arr
console.log(x, y, z)  //1 2 3

const [a, , , b] = arr
console.log(a, b)   //1 4
```');