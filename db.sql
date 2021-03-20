DROP TABLE IF EXISTS auth_group;
CREATE TABLE auth_group (
  id INT NOT NULL AUTO_INCREMENT,
  name varchar(150) NOT NULL UNIQUE,
  PRIMARY KEY(id)
);

DROP TABLE IF EXISTS auth_group_permissions;
CREATE TABLE auth_group_permissions (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  group_id INT NOT NULL REFERENCES auth_group (id),
  permission_id INT NOT NULL REFERENCES auth_permission (id)
);

DROP TABLE IF EXISTS auth_permission;
CREATE TABLE auth_permission (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  content_type_id INT NOT NULL REFERENCES django_content_type (id),
  codename varchar(100) NOT NULL, name varchar(255) NOT NULL
);

DROP TABLE IF EXISTS auth_user;
CREATE TABLE auth_user (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  password varchar(128) NOT NULL,
  last_login datetime NULL,
  is_superuser bool NOT NULL,
  username varchar(150) NOT NULL UNIQUE,
  last_name varchar(150) NOT NULL,
  email varchar(254) NOT NULL,
  is_staff bool NOT NULL,
  is_active bool NOT NULL,
  date_joined datetime NOT NULL,
  first_name varchar(150) NOT NULL
);

DROP TABLE IF EXISTS auth_user_groups;
CREATE TABLE auth_user_groups (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL REFERENCES auth_user (id),
  group_id INT NOT NULL REFERENCES auth_group (id)
);

DROP TABLE IF EXISTS auth_user_user_permissions;
CREATE TABLE auth_user_user_permissions (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL REFERENCES auth_user (id),
  permission_id INT NOT NULL REFERENCES auth_permission (id)
);

DROP TABLE IF EXISTS django_admin_log;
CREATE TABLE django_admin_log (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  action_time datetime NOT NULL,
  object_id text NULL,
  object_repr varchar(200) NOT NULL,
  change_message text NOT NULL,
  content_type_id INT NULL REFERENCES django_content_type (id),
  user_id INT NOT NULL REFERENCES auth_user (id),
  action_flag smallint unsigned NOT NULL CHECK (action_flag >= 0)
);

DROP TABLE IF EXISTS django_content_type;
CREATE TABLE django_content_type (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  app_label varchar(100) NOT NULL,
  model varchar(100) NOT NULL
);

DROP TABLE IF EXISTS django_migrations;
CREATE TABLE django_migrations (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  app varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  applied datetime NOT NULL
);

DROP TABLE IF EXISTS django_session;
CREATE TABLE django_session (
  session_key varchar(40) NOT NULL PRIMARY KEY,
  session_data text NOT NULL,
  expire_date datetime NOT NULL
);

DROP TABLE IF EXISTS filestore_s3imageobject;
CREATE TABLE filestore_s3imageobject (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  filename varchar(256) NOT NULL,
  image varchar(100) NOT NULL
);
