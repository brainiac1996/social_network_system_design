CREATE TABLE "user" (
  "id" integer PRIMARY KEY,
  "user_name" varchar,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "phone" varchar,
  "avatar_url" varchar,
  "description" varchar,
  "interest" varchar,
  "city_id" integer
);

CREATE TABLE "city" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "address" varchar,
  "postcode" varchar
);

CREATE TABLE "message" (
  "id" integer PRIMARY KEY,
  "text" varchar,
  "is_read" boolean,
  "created_date" varchar,
  "user_id" integer
);

CREATE TABLE "chat" (
  "id" integer PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "chat_user_junction" (
  "user_id" integer,
  "chat_id" integer
);

CREATE TABLE "chat_message_junction" (
  "chat_id" integer,
  "message_id" integer
);

CREATE TABLE "friend_message_junction" (
  "message_id" integer,
  "sending_user_id" integer,
  "receiving_user_id" integer
);

CREATE TABLE "post" (
  "id" integer PRIMARY KEY,
  "text" varchar,
  "likes_count" integer,
  "views_count" integer
);

CREATE TABLE "media" (
  "id" integer PRIMARY KEY,
  "body" text,
  "small_url" varchar,
  "medium_url" varchar,
  "large_url" varchar,
  "post_id" integer
);

CREATE TABLE "comment" (
  "id" integer PRIMARY KEY,
  "text" varchar,
  "user_id" integer,
  "post_id" integer
);

CREATE TABLE "hashtag" (
  "id" integer PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "post_hashtag_junction" (
  "post_id" integer,
  "hashtag_id" integer
);

CREATE TABLE "relation" (
  "id" integer PRIMARY KEY,
  "type" integer
);

CREATE TABLE "user_relation_junction" (
  "current_user_id" integer,
  "relationship_user_id" integer,
  "relation_id" integer
);

COMMENT ON COLUMN "relation"."type" IS 'друзья - 1, любовные отношения - 2, подписчики - 3';

ALTER TABLE "user" ADD FOREIGN KEY ("city_id") REFERENCES "city" ("id");

ALTER TABLE "message" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "chat_user_junction" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "chat_user_junction" ADD FOREIGN KEY ("chat_id") REFERENCES "chat" ("id");

ALTER TABLE "chat_message_junction" ADD FOREIGN KEY ("message_id") REFERENCES "message" ("id");

ALTER TABLE "chat_message_junction" ADD FOREIGN KEY ("chat_id") REFERENCES "chat" ("id");

ALTER TABLE "friend_message_junction" ADD FOREIGN KEY ("message_id") REFERENCES "message" ("id");

ALTER TABLE "friend_message_junction" ADD FOREIGN KEY ("sending_user_id") REFERENCES "user" ("id");

ALTER TABLE "friend_message_junction" ADD FOREIGN KEY ("receiving_user_id") REFERENCES "user" ("id");

ALTER TABLE "media" ADD FOREIGN KEY ("post_id") REFERENCES "post" ("id");

ALTER TABLE "post_hashtag_junction" ADD FOREIGN KEY ("post_id") REFERENCES "post" ("id");

ALTER TABLE "post_hashtag_junction" ADD FOREIGN KEY ("hashtag_id") REFERENCES "hashtag" ("id");

ALTER TABLE "comment" ADD FOREIGN KEY ("post_id") REFERENCES "post" ("id");

ALTER TABLE "comment" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_relation_junction" ADD FOREIGN KEY ("current_user_id") REFERENCES "user" ("id");

ALTER TABLE "user_relation_junction" ADD FOREIGN KEY ("relationship_user_id") REFERENCES "user" ("id");

ALTER TABLE "user_relation_junction" ADD FOREIGN KEY ("relation_id") REFERENCES "relation" ("id");
