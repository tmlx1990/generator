MyBatis Generator (MBG)
=======================

[![Build Status](https://github.com/mybatis/generator/workflows/Java%20CI/badge.svg?branch=master)](https://github.com/mybatis/generator/actions?query=workflow%3A%22Java+CI%22)
[![Coverage Status](https://coveralls.io/repos/mybatis/generator/badge.svg?branch=master&service=github)](https://coveralls.io/github/mybatis/generator?branch=master)
[![Maven central](https://maven-badges.herokuapp.com/maven-central/org.mybatis.generator/mybatis-generator/badge.svg)](https://maven-badges.herokuapp.com/maven-central/org.mybatis.generator/mybatis-generator)
[![Sonatype Nexus (Snapshots)](https://img.shields.io/nexus/s/https/oss.sonatype.org/org.mybatis.generator/mybatis-generator.svg)](https://oss.sonatype.org/content/repositories/snapshots/org/mybatis/generator/mybatis-generator/)
[![License](http://img.shields.io/:license-apache-brightgreen.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=mybatis_generator&metric=alert_status)](https://sonarcloud.io/dashboard?id=mybatis_generator)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=mybatis_generator&metric=security_rating)](https://sonarcloud.io/dashboard?id=mybatis_generator)

![mybatis-generator](http://mybatis.github.io/images/mybatis-logo.png)

This is a code generator for MyBatis.

This library will generate code for use with MyBatis. It will introspect a database table (or many tables) and will generate artifacts that can be used to access the table(s). This lessens the initial nuisance of setting up objects and configuration files to interact with database tables. MBG seeks to make a major impact on the large percentage of database operations that are simple CRUD (Create, Retrieve, Update, Delete).

MBG can generate code in multiple styles (or "runtimes"). MBG can generate code for Java based projects, or for Kotlin based projects.

本项目基于generator v1.4.1版本进行升级改造。
# 工具介绍
本工具可以通过读取固定PDM文件，获取数据库中相应列名对应的中文名称，然后在生成实体类的使用添加到相应字段上。
# 使用方法
- 将core目录中的mybatis-generator-core导入到idea中。
- 配置Maven打包命令
  mvn clean package
- 将target打包后的jar文件、相应的lib文件夹及项目中的mybatis-generator-config_1_0.dtd拷贝到官方下载的mybatis-generator目录下。
- 替换原有mybatis-generator-core-..jar包。
- 将要生成的表对应的PDM放到mybatis-generator所在目录。配置generator.xml增加pdm路径信息，可以参考项目中的generatorConfig.xml。
  <pdmUrl url="./1.pdm"></pdmUrl>
- 执行run.bat文件。等待生成文件。
# 版本介绍
## v1.0版本
- 增加读取指定目录pdm进行生成实体类中文功能。
- 修改SerializablePlugin插件
- 添加ImportPlugin、AnnotationClassPlugin插件，可以通过配置进行自动加入引入包、类注解的功能。
