-- partner
CREATE TABLE partners
(
  id            bigint auto_increment PRIMARY KEY comment 'ID',
  partner_token varchar(255) NOT NULL comment 'partner_token',
  partner_name  varchar(255) NOT NULL comment '파트너명',
  business_no   varchar(255) NOT NULL comment '사업자등록번호',
  email         varchar(255) NOT NULL comment 'email',
  status        varchar(30)  NOT NULL DEFAULT 'ENABLE' comment '상태',
  created_at    datetime(6) NOT NULL comment '생성 일시',
  updated_at    datetime(6) NULL comment '수정 일시'
) comment 'partners' charset = utf8mb4;

CREATE
  INDEX partner_idx01 ON partners (partner_token);

CREATE
  INDEX partner_idx02 ON partners (created_at);

CREATE
  INDEX partner_idx03 ON partners (updated_at);

-- item
CREATE TABLE items
(
  id         bigint auto_increment PRIMARY KEY comment 'ID',
  item_token varchar(255) NOT NULL comment 'item_token',
  partner_id bigint       NOT NULL comment '파트너 ID',
  item_name  varchar(255) NOT NULL comment '상품명',
  item_price int(11) NOT NULL comment '상품 가격',
  status     varchar(30)  NOT NULL DEFAULT 'PREPARE' comment '상태',
  deleted_at datetime(6) NULL comment '삭제 일시',
  created_at datetime(6) NOT NULL comment '생성 일시',
  updated_at datetime(6) NULL comment '수정 일시'
) comment 'items' charset = utf8mb4;

CREATE
  INDEX item_idx01 ON items (item_token);

CREATE
  INDEX item_idx02 ON items (partner_id);

CREATE
  INDEX item_idx03 ON items (created_at);

CREATE
  INDEX item_idx04 ON items (updated_at);

CREATE
  INDEX item_idx05 ON items (deleted_at);


-- item_option_group
CREATE TABLE item_option_groups
(
  id                     bigint auto_increment PRIMARY KEY comment 'ID',
  item_id                bigint      NOT NULL comment '상품 ID',
  ordering               tinyint(3) NOT NULL comment '정렬순서',
  item_option_group_name varchar(30) NOT NULL comment '옵션그룹명 (색상, 사이즈 등)',
  created_at             datetime(6) NOT NULL comment '생성 일시',
  updated_at             datetime(6) NULL comment '수정 일시'
) comment 'item_option_groups' charset = utf8mb4;

CREATE
  INDEX item_option_group_idx01 ON item_option_groups (item_id);

CREATE
  INDEX item_option_group_idx02 ON item_option_groups (created_at);

CREATE
  INDEX item_option_group_idx03 ON item_option_groups (updated_at);


-- item_option
CREATE TABLE item_options
(
  id                   bigint auto_increment PRIMARY KEY comment 'ID',
  item_option_group_id bigint      NOT NULL comment '상품 옵션 그룹 ID',
  ordering             tinyint(3) NOT NULL comment '정렬순서',
  item_option_name     varchar(30) NOT NULL comment '옵션명 (빨강, 파랑, XL, L)',
  item_option_price    int(11) NOT NULL comment '상품 옵션 가격',
  created_at           datetime(6) NOT NULL comment '생성 일시',
  updated_at           datetime(6) NULL comment '수정 일시'
) comment 'item_options' charset = utf8mb4;

CREATE
  INDEX item_option_idx01 ON item_options (item_option_group_id);

CREATE
  INDEX item_option_idx02 ON item_options (created_at);

CREATE
  INDEX item_option_idx03 ON item_options (updated_at);


-- order
CREATE TABLE orders
(
  id                bigint auto_increment PRIMARY KEY comment 'ID',
  order_token       varchar(255) NOT NULL comment 'order_token',
  user_id           bigint       NOT NULL comment '유저 ID',
  pay_method        varchar(30)  NOT NULL comment '결제수단',
  receiver_name     varchar(30)  NOT NULL comment '수령자명',
  receiver_phone    varchar(30)  NOT NULL comment '수령자 휴대폰번호',
  receiver_zipcode  varchar(10)  NOT NULL comment '수령자 우편번호',
  receiver_address1 varchar(255) NOT NULL comment '수령자 주소1',
  receiver_address2 varchar(255) NOT NULL comment '수령자 주소2',
  etc_message       varchar(255) NOT NULL comment '남기는 말',
  status            varchar(30)  NOT NULL DEFAULT 'INIT' comment '상태',
  ordered_at        datetime(6) NOT NULL comment '주문 일시',
  created_at        datetime(6) NOT NULL comment '생성 일시',
  updated_at        datetime(6) NULL comment '수정 일시'
) comment 'orders' charset = utf8mb4;

CREATE
  INDEX order_idx01 ON orders (order_token);

CREATE
  INDEX order_idx02 ON orders (user_id);

CREATE
  INDEX order_idx03 ON orders (ordered_at);

CREATE
  INDEX order_idx04 ON orders (created_at);

CREATE
  INDEX order_idx05 ON orders (updated_at);


-- order_items
CREATE TABLE order_items
(
  id              bigint auto_increment PRIMARY KEY comment 'ID',
  order_id        bigint       NOT NULL comment 'order_id',
  order_count     tinyint      NOT NULL comment '주문갯수',
  partner_id      bigint       NOT NULL comment '파트너 ID',
  item_id         bigint       NOT NULL comment '상품 ID',
  item_name       varchar(255) NOT NULL comment '상품명',
  item_token      varchar(30)  NOT NULL comment '상품 token',
  item_price      int(11) NOT NULL comment '상품 가격',
  delivery_status varchar(30)  NOT NULL DEFAULT 'BEFORE_DELIVERY' comment '상태',
  created_at      datetime(6) NOT NULL comment '생성 일시',
  updated_at      datetime(6) NULL comment '수정 일시'
) comment 'order_items' charset = utf8mb4;

CREATE
  INDEX order_item_idx01 ON order_items (order_id);

CREATE
  INDEX order_item_idx02 ON order_items (partner_id);

CREATE
  INDEX order_item_idx03 ON order_items (item_id);

CREATE
  INDEX order_item_idx04 ON order_items (item_token);

CREATE
  INDEX order_item_idx05 ON order_items (created_at);

CREATE
  INDEX order_item_idx06 ON order_items (updated_at);


-- order_item_option_groups
CREATE TABLE order_item_option_groups
(
  id                     bigint auto_increment PRIMARY KEY comment 'ID',
  order_item_id          bigint       NOT NULL comment 'order_item_id',
  ordering               tinyint(3) NOT NULL comment '정렬순서',
  item_option_group_name varchar(255) NOT NULL comment '상품 옵션 그룹명',
  created_at             datetime(6) NOT NULL comment '생성 일시',
  updated_at             datetime(6) NULL comment '수정 일시'
) comment 'order_item_option_groups' charset = utf8mb4;

CREATE
  INDEX order_item_option_groups_idx01 ON order_item_option_groups (order_item_id);

CREATE
  INDEX order_item_option_groups_idx02 ON order_item_option_groups (created_at);

CREATE
  INDEX order_item_option_groups_idx03 ON order_item_option_groups (updated_at);


-- order_item_options
CREATE TABLE order_item_options
(
  id                         bigint auto_increment PRIMARY KEY comment 'ID',
  order_item_option_group_id bigint       NOT NULL comment 'order_item_option_group_id',
  ordering                   tinyint(3) NOT NULL comment '정렬순서',
  item_option_name           varchar(255) NOT NULL comment '상품 옵션명',
  item_option_price          int(11) NOT NULL comment '상품 옵션 가격',
  created_at                 datetime(6) NOT NULL comment '생성 일시',
  updated_at                 datetime(6) NULL comment '수정 일시'
) comment 'order_item_options' charset = utf8mb4;

CREATE
  INDEX order_item_options_idx01 ON order_item_options (order_item_option_group_id);

CREATE
  INDEX order_item_options_idx02 ON order_item_options (created_at);

CREATE
  INDEX order_item_options_idx03 ON order_item_options (updated_at);