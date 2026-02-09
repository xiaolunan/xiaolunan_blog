# SobBlogSystem Flutter Web 前端文档

## 项目概述

基于 Spring Boot 后端接口的博客系统 Flutter Web 前端开发文档。

**后端地址**: `http://<server-ip>:8080`  
**API 版本**: v1  
**认证方式**: JWT Token

---

## 一、接口汇总

### 1. 门户端接口 (Public APIs)

| 模块 | 接口 | 方法 | 路径 | 说明 |
|------|------|------|------|------|
| **文章** | 获取文章列表 | GET | `/portal/article/list/{page}/{size}` | 分页获取已发布文章 |
| | 按分类获取文章 | GET | `/portal/article/list/{categoryId}/{page}/{size}` | 根据分类ID筛选 |
| | 获取文章详情 | GET | `/portal/article/{articleId}` | 获取单篇文章详情 |
| | 获取推荐文章 | GET | `/portal/article/recomment/{articleId}/{size}` | 根据标签推荐 |
| | 获取置顶文章 | GET | `/portal/article/top` | 获取置顶文章列表 |
| | 获取标签云 | GET | `/portal/article/label/{size}` | 获取热门标签 |
| | 按标签获取文章 | GET | `/portal/article/list/label/{label}/{page}/{size}` | 根据标签筛选 |
| **评论** | 添加评论 | POST | `/portal/comment` | 提交评论 |
| | 删除评论 | DELETE | `/portal/comment/{commentId}` | 删除自己的评论 |
| | 获取评论列表 | GET | `/portal/comment/list/{articleId}/{page}/{size}` | 文章评论列表 |
| **网站信息** | 获取分类列表 | GET | `/portal/web_size_info/categories` | 所有分类 |
| | 获取网站标题 | GET | `/portal/web_size_info/title` | 网站标题 |
| | 获取访问量 | GET | `/portal/web_size_info/view_count` | 网站访问统计 |
| | 获取SEO信息 | GET | `/portal/web_size_info/seo` | SEO元数据 |
| | 获取轮播图 | GET | `/portal/web_size_info/loop` | 首页轮播图 |
| | 获取友情链接 | GET | `/portal/web_size_info/friend_link` | 友情链接列表 |
| **搜索** | 搜索文章 | GET | `/portal/search?keyword={keyword}&page={page}` | 全文搜索 |

### 2. 用户端接口 (User APIs)

| 接口 | 方法 | 路径 | 需要认证 |
|------|------|------|----------|
| 初始化管理员账号 | POST | `/user/admin_account` | 否 |
| 用户注册 | POST | `/user/join_in` | 否 |
| 用户登录 | POST | `/user/log_on/{captcha}/{captcha_key}` | 否 |
| 获取验证码 | GET | `/user/captcha?captchaKey={key}` | 否 |
| 发送邮箱验证码 | GET | `/user/verify_code?type={type}&emailAddress={email}` | 否 |
| 修改密码 | PUT | `/user/updateUserPassword` | 是 |
| 忘记密码 | POST | `/user/forget/password` | 否 |
| 获取用户信息 | POST | `/user/user_info/{userId}` | 是 |
| 修改用户信息 | PUT | `/user/user_info/{userId}` | 是 |
| 获取用户列表 | GET | `/user/list?page={page}&size={size}` | 管理员 |
| 删除用户 | DELETE | `/user/delete/{userId}` | 管理员 |
| 检查邮箱 | GET | `/user/email?email={email}` | 否 |
| 检查用户名 | GET | `/user/userName?userName={name}` | 否 |
| 修改邮箱 | PUT | `/user/email?email={email}&verifyCode={code}` | 是 |
| 退出登录 | GET | `/user/logout` | 是 |

### 3. 管理端接口 (Admin APIs)

| 模块 | 接口 | 方法 | 路径 |
|------|------|------|------|
| **文章管理** | 发布文章 | POST | `/admin/article` |
| | 删除文章 | DELETE | `/admin/article/{articleId}` |
| | 更新文章 | PUT | `/admin/article/{articleId}` |
| | 获取文章详情 | GET | `/admin/article/{articleId}` |
| | 获取文章列表 | GET | `/admin/article/list/{page}/{size}` |
| | 置顶文章 | PUT | `/admin/article/top/{articleId}` |
| | 修改状态删除 | DELETE | `/admin/article/state/{articleId}` |
| **分类管理** | 添加分类 | POST | `/admin/category` |
| | 删除分类 | DELETE | `/admin/{categoryId}` |
| | 更新分类 | PUT | `/admin/{categoryId}` |
| | 获取分类详情 | GET | `/admin/{categoryId}` |
| | 获取分类列表 | GET | `/admin/list` |
| **轮播图管理** | 添加轮播图 | POST | `/admin/looper` |
| | 删除轮播图 | DELETE | `/admin/looper/{loopId}` |
| | 更新轮播图 | PUT | `/admin/looper/{loopId}` |
| | 获取轮播图详情 | GET | `/admin/looper/{loopId}` |
| | 获取轮播图列表 | GET | `/admin/looper/list` |
| **友情链接管理** | 添加友情链接 | POST | `/admin/friend_link` |
| | 删除友情链接 | DELETE | `/admin/friend_link/{friendLinkId}` |
| | 更新友情链接 | PUT | `/admin/friend_link/{friendLinkId}` |
| | 获取友情链接详情 | GET | `/admin/friend_link/{friendLinkId}` |
| | 获取友情链接列表 | GET | `/admin/friend_link/list` |
| **图片管理** | 上传图片 | POST | `/admin/image/image` |
| | 删除图片 | DELETE | `/admin/image/{imageId}` |
| | 查看图片 | GET | `/admin/image/{imageId}` |
| | 获取图片列表 | GET | `/admin/image/list/{page}/{size}` |
| **评论管理** | 删除评论 | DELETE | `/admin/comment/{commentId}` |
| | 获取评论详情 | GET | `/admin/comment/{commentId}` |
| | 获取评论列表 | GET | `/admin/comment/list?page={page}&size={size}` |
| | 置顶评论 | PUT | `/admin/comment/top/{commentId}` |
| **网站信息管理** | 获取网站标题 | GET | `/admin/web_size_info/title` |
| | 更新网站标题 | PUT | `/admin/web_size_info/title?title={title}` |
| | 获取SEO信息 | GET | `/admin/web_size_info/seo` |
| | 更新SEO信息 | PUT | `/admin/web_size_info/seo?keywords={kw}&description={desc}` |
| | 获取访问量 | GET | `/admin/web_size_info/view_count` |

---

## 二、数据模型 (Data Models)

### 1. Article (文章)
```dart
class Article {
  String id;
  String title;
  String userId;
  String? userAvatar;
  String? userName;
  String categoryId;
  String content;
  String type;        // 文章类型
  String state;       // 0删除, 1发布, 2草稿, 3置顶
  String summary;
  String label;       // 逗号分隔的标签
  int viewCount;
  DateTime createTime;
  DateTime updateTime;
  SobUserNoPassword? sobUserNoPassword;
  List<String>? labelsList;
}
```

### 2. SobUser (用户)
```dart
class SobUser {
  String id;
  String userName;
  String password;
  String roles;
  String avatar;
  String? email;
  String? sign;       // 签名
  String state;
  String regIp;
  String loginIp;
  DateTime createTime;
  DateTime updateTime;
}
```

### 3. Category (分类)
```dart
class Category {
  String id;
  String name;
  String pinyin;
  String description;
  int order;
  String status;
  DateTime createTime;
  DateTime updateTime;
}
```

### 4. Comment (评论)
```dart
class Comment {
  String id;
  String? parentContent;  // 父评论内容（回复用）
  String articleId;
  String content;
  String userId;
  String? userAvatar;
  String? userName;
  String state;
  DateTime createTime;
  DateTime updateTime;
}
```

### 5. Looper (轮播图)
```dart
class Looper {
  String id;
  String title;
  int order;
  String state;
  String targetUrl;
  String imageUrl;
  DateTime createTime;
  DateTime updateTime;
}
```

### 6. FriendLink (友情链接)
```dart
class FriendLink {
  String id;
  String name;
  String logo;
  String url;
  int order;
  String state;
  DateTime createTime;
  DateTime updateTime;
}
```

### 7. Images (图片)
```dart
class Images {
  String id;
  String userId;
  String url;
  String path;
  String contentType;
  String name;
  String state;
  DateTime createTime;
  DateTime updateTime;
}
```

### 8. WebSizeInfo (网站信息)
```dart
class WebSizeInfo {
  String id;
  String siteTitle;
  String? seoKeywords;
  String? seoDescription;
  int? viewCount;
  DateTime createTime;
  DateTime updateTime;
}
```

### 9. Label (标签)
```dart
class Label {
  String id;
  String name;
  int count;
  DateTime createTime;
  DateTime updateTime;
}
```

### 10. ResponseResult (统一响应)
```dart
class ResponseResult<T> {
  bool isSuccess;
  String message;
  int code;
  T? data;
}
```

---

## 三、页面规划

### 页面总数：约 18-22 个页面

#### 1. 门户端页面 (8-9 页)

| 页面名称 | 路由 | 功能描述 |
|----------|------|----------|
| **首页** | `/` | 轮播图、置顶文章、文章列表、标签云、友情链接 |
| **文章列表页** | `/articles` | 分页展示所有文章 |
| **分类文章页** | `/category/:id` | 按分类展示文章 |
| **标签文章页** | `/tag/:name` | 按标签展示文章 |
| **文章详情页** | `/article/:id` | 文章正文、评论区、推荐文章 |
| **搜索结果页** | `/search` | 搜索关键词结果展示 |
| **登录页** | `/login` | 用户登录表单 |
| **注册页** | `/register` | 用户注册表单 |
| **忘记密码页** | `/forgot-password` | 找回密码流程 |

#### 2. 用户中心页面 (3-4 页)

| 页面名称 | 路由 | 功能描述 |
|----------|------|----------|
| **个人中心** | `/profile` | 用户信息展示、头像、签名 |
| **编辑资料页** | `/profile/edit` | 修改用户名、签名、头像 |
| **修改密码页** | `/profile/password` | 修改密码 |
| **修改邮箱页** | `/profile/email` | 修改邮箱地址 |

#### 3. 管理后台页面 (7-9 页)

| 页面名称 | 路由 | 功能描述 |
|----------|------|----------|
| **管理控制台** | `/admin/dashboard` | 数据统计、快捷入口 |
| **文章管理** | `/admin/articles` | 文章列表、增删改查 |
| **文章编辑** | `/admin/article/edit/:id` | 新增/编辑文章 |
| **分类管理** | `/admin/categories` | 分类列表管理 |
| **轮播图管理** | `/admin/loopers` | 轮播图管理 |
| **友情链接管理** | `/admin/friend-links` | 友情链接管理 |
| **评论管理** | `/admin/comments` | 评论审核、删除 |
| **用户管理** | `/admin/users` | 用户列表管理 |
| **网站设置** | `/admin/settings` | 网站标题、SEO设置 |
| **图片管理** | `/admin/images` | 图片上传管理 |

---

## 四、路由结构

```
/
├── /                          # 首页
├── /articles                  # 文章列表
├── /category/:categoryId      # 分类文章
├── /tag/:label                # 标签文章
├── /article/:articleId        # 文章详情
├── /search                    # 搜索结果
├── /login                     # 登录
├── /register                  # 注册
├── /forgot-password           # 忘记密码
├── /profile                   # 个人中心
│   ├── /edit                  # 编辑资料
│   ├── /password              # 修改密码
│   └── /email                 # 修改邮箱
└── /admin                     # 管理后台
    ├── /dashboard             # 控制台
    ├── /articles              # 文章管理
    ├── /article/edit/:id      # 文章编辑
    ├── /categories            # 分类管理
    ├── /loopers               # 轮播图管理
    ├── /friend-links          # 友情链接
    ├── /comments              # 评论管理
    ├── /users                 # 用户管理
    ├── /settings              # 网站设置
    └── /images                # 图片管理
```

---

## 五、Flutter 项目结构建议

```
lib/
├── main.dart                      # 应用入口
├── app.dart                       # 应用配置
├── config/
│   ├── api_config.dart            # API 地址配置
│   ├── routes.dart                # 路由配置
│   └── theme.dart                 # 主题配置
├── models/                        # 数据模型
│   ├── article.dart
│   ├── user.dart
│   ├── category.dart
│   ├── comment.dart
│   ├── looper.dart
│   ├── friend_link.dart
│   ├── image.dart
│   ├── web_size_info.dart
│   ├── label.dart
│   └── response_result.dart
├── services/                      # API 服务
│   ├── api_client.dart            # HTTP 客户端
│   ├── article_service.dart
│   ├── user_service.dart
│   ├── category_service.dart
│   ├── comment_service.dart
│   ├── looper_service.dart
│   ├── friend_link_service.dart
│   ├── image_service.dart
│   └── web_size_info_service.dart
├── providers/                     # 状态管理
│   ├── auth_provider.dart
│   ├── article_provider.dart
│   ├── user_provider.dart
│   └── admin_provider.dart
├── screens/                       # 页面
│   ├── home/
│   │   ├── home_screen.dart
│   │   └── widgets/
│   ├── article/
│   │   ├── article_list_screen.dart
│   │   ├── article_detail_screen.dart
│   │   └── widgets/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   ├── register_screen.dart
│   │   └── forgot_password_screen.dart
│   ├── profile/
│   │   ├── profile_screen.dart
│   │   ├── edit_profile_screen.dart
│   │   └── widgets/
│   └── admin/
│       ├── admin_layout.dart
│       ├── dashboard_screen.dart
│       ├── article_management_screen.dart
│       ├── article_edit_screen.dart
│       ├── category_management_screen.dart
│       ├── looper_management_screen.dart
│       ├── friend_link_screen.dart
│       ├── comment_management_screen.dart
│       ├── user_management_screen.dart
│       ├── settings_screen.dart
│       └── image_management_screen.dart
├── widgets/                       # 公共组件
│   ├── app_bar.dart
│   ├── drawer.dart
│   ├── article_card.dart
│   ├── comment_item.dart
│   ├── loading_widget.dart
│   └── error_widget.dart
├── utils/                         # 工具类
│   ├── constants.dart
│   ├── helpers.dart
│   └── validators.dart
└── middleware/                    # 中间件
    └── auth_guard.dart
```

---

## 六、关键功能实现要点

### 1. 认证流程
- 使用 JWT Token 存储用户认证信息
- Token 存储在 localStorage/SharedPreferences
- 每次请求自动携带 Token (Authorization: Bearer {token})
- Token 过期自动跳转到登录页

### 2. 富文本编辑器
- 推荐使用 `flutter_quill` 或 `html_editor_enhanced`
- 支持 Markdown 编辑和预览
- 图片上传到 `/admin/image/image`

### 3. 图片处理
- 使用 `cached_network_image` 加载网络图片
- 支持图片懒加载
- 图片上传使用 `image_picker` + `dio`

### 4. 响应式设计
- 使用 `flutter_adaptive_scaffold` 或自定义断点
- 桌面端：侧边栏导航
- 平板端：可折叠侧边栏
- 移动端：底部导航栏

### 5. 状态管理
- 推荐使用 `Riverpod` 或 `Bloc`
- 分离 UI 状态和业务逻辑
- 全局状态：用户信息、认证状态

### 6. 分页加载
- 使用 `infinite_scroll_pagination` 或自定义实现
- 支持下拉刷新和上拉加载更多

---

## 七、依赖建议

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # 网络请求
  dio: ^5.0.0
  retrofit: ^4.0.0
  
  # 状态管理
  flutter_riverpod: ^2.0.0
  
  # 路由
  go_router: ^13.0.0
  
  # UI 组件
  flutter_screenutil: ^5.0.0
  cached_network_image: ^3.0.0
  shimmer: ^3.0.0
  flutter_spinkit: ^5.0.0
  
  # 富文本编辑
  flutter_quill: ^9.0.0
  
  # 本地存储
  shared_preferences: ^2.0.0
  
  # 图片处理
  image_picker: ^1.0.0
  image_picker_for_web: ^3.0.0
  
  # 日期处理
  intl: ^0.18.0
  
  # 工具类
  freezed_annotation: ^2.0.0
  json_annotation: ^4.0.0

dev_dependencies:
  build_runner: ^2.0.0
  freezed: ^2.0.0
  json_serializable: ^6.0.0
  retrofit_generator: ^8.0.0
```

---

## 八、开发阶段规划

### 第一阶段：基础架构 (1-2 周)
- [ ] 项目初始化
- [ ] 路由配置
- [ ] 状态管理搭建
- [ ] API 服务封装
- [ ] 数据模型定义

### 第二阶段：门户端开发 (2-3 周)
- [ ] 首页布局
- [ ] 文章列表/详情页
- [ ] 评论功能
- [ ] 搜索功能
- [ ] 响应式适配

### 第三阶段：用户系统 (1-2 周)
- [ ] 登录/注册/找回密码
- [ ] 个人中心
- [ ] JWT 认证流程

### 第四阶段：管理后台 (2-3 周)
- [ ] 控制台页面
- [ ] 文章管理 (含富文本编辑)
- [ ] 分类/轮播图/友情链接管理
- [ ] 评论/用户管理
- [ ] 网站设置

### 第五阶段：优化上线 (1 周)
- [ ] 性能优化
- [ ] 错误处理
- [ ] 测试
- [ ] 部署上线

---

## 九、注意事项

1. **跨域问题**: 确保后端配置了 CORS，允许前端域名访问
2. **图片访问**: 图片接口直接返回图片流，使用 `Image.network` 或 `CachedNetworkImage`
3. **验证码**: 登录/注册时需要先获取验证码图片，显示给用户输入
4. **邮箱验证**: 注册和修改邮箱需要邮箱验证码
5. **权限控制**: 管理端页面需要前置权限检查，无权限跳转首页或403页面
6. **Token 刷新**: 实现 Token 自动刷新机制或使用 Refresh Token
7. **Web 兼容性**: Flutter Web 部分功能需要特殊处理，如文件上传、本地存储等

---

## 十、Swagger 文档

后端已集成 Swagger，可访问：
```
http://<server-ip>:8080/swagger-ui.html
```

用于查看详细的 API 文档和测试接口。

---

**文档生成时间**: 2026-02-09  
**后端版本**: SobBlogSystemDemo Spring Boot 2.7.18
