# 在线课程管理系统 - 管理员模块

这是S380F小组项目的管理员模块，主要实现以下功能：

## 功能列表

1. **用户管理**
   - 添加管理员和注册用户
   - 编辑用户信息
   - 删除用户账户
   - 用户角色管理（ADMIN/USER）

2. **课程材料管理**
   - 添加课程材料
   - 编辑课程材料信息
   - 删除课程材料
   - 批量上传课程材料

3. **安全访问控制**
   - 基于角色的访问控制
   - 用户认证

## 技术栈

- Spring Boot 3.x
- Spring MVC
- Spring Security
- Spring Data JPA
- H2 Database
- JSP视图
- Bootstrap样式

## 项目结构

```
src/main/
  ├── java/hkmu/wadd/
  │   ├── config/                 # 安全配置
  │   ├── controller/             # MVC控制器
  │   ├── dao/                    # 数据访问层
  │   ├── exception/              # 自定义异常
  │   ├── model/                  # 数据模型
  │   └── OnlineCourseAdminApplication.java   # 主应用类
  ├── resources/
  │   └── application.properties  # 应用配置
  └── webapp/
      └── WEB-INF/jsp/            # 视图模板
```

## 主要页面
- `/login` - 登录页面
- `/admin/dashboard` - 管理员仪表板
- `/admin/users` - 用户管理
- `/admin/materials` - 材料管理
- `/admin/materials/batch-upload` - 批量上传材料

## 安装与运行

1. 克隆项目
2. 使用Gradle构建：`./gradlew build`
3. 运行应用：`./gradlew bootRun`
4. 访问: `http://localhost:8080`

## 默认账户
- 用户名: admin
- 密码: admin123

## 注意事项
- 上传文件存储在项目的`uploads`目录中
- 最大上传文件大小限制为10MB
- 批量上传时，所有文件共享同一标题和描述 