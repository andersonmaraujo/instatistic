DROP TABLE IF NOT EXISTS 'users';
DROP TABLE IF NOT EXISTS 'user_id';

CREATE TABLE 'users_id' (
	id INT NOT NTLL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE 'users' (
	'user_id' VARCHAR(32) NOT NULL DEFAULT 0,
	'user_email' VARCHAR(40) NOT NULL,
	'user_password' VARCHAR(40) NOT NULL,
	'user_created_datetime' DATETIME DEFAULT CURRENT_TIMESTAMP,
	'user_updated_datetime' DATETIME ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE 'instagram' (
	'id' INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	'instagram_access_token' VARCHAR(40) NOT NULL,
	'instagram_user_id' INT NOT NULL DEFAULT 0,
	'instagram_user_username' VARCHAR(20) NOT NULL,
	'instagram_user_fullname' VARCHAR(30) NOT NULL,
	'instagram_user_profile_picture' VARCHAR(100),
	'instagram_user_bio' TEXT,
	'instagram_user_website' VARCHAR(100),
	'instagram_created_datetime' DATETIME DEFAULT CURRENT_TIMESTAMP,
	'instagram_updated_datetime' DATETIME ON UPDATE CURRENT_TIMESTAMP,
	'user_id' VARCHAR(32)
);

CREATE TABLE 'instagram_data' (
	'instagram_data_id' INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	'instagram_data_counts_followed_by' INT NOT NULL,
	'instagram_data_counts_follows' INT NOT NULL,
	'instagram_data_counts_media' INT NOT NULL,
	'instagram_data_created_datetime' DATETIME DEFAULT CURRENT_TIMESTAMP,
	'instagram_data_updated_datetime' DATETIME ON UPDATE CURRENT_TIMESTAMP,
	'user_id' VARCHAR(32) NOT NULL DEFAULT 0
);

CREATE TABLE 'instagram_relationship' (
	'instagram_relationship_id' INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	'instagram_relationship_type' VARCHAR(5),
	'instagram_relationship_user_id' INT NOT NULL,
	'user_id' VARCHAR(32) NOT NULL
);

CREATE TABLE 'instagram_media' (
	'instagram_media_id' INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	'instagram_media_permalink' VARCHAR(50) NOT NULL,
	'instagram_media_location_id' INT NOT NULL,
	'instagram_media_location_latitude' DECIMAL(0,10),
	'instagram_media_location_longitude' DECIMAL(0,10),
	'instagram_media_location_street_address' VARCHAR(50),
	'instagram_media_location_name' VARCHAR(50) NOT NULL
	'instagram_media_counts_comment' INT NOT NULL DEFAULT 0,
	'instagram_media_counts_like' INT NOT NULL DEFAULT 0,
	'instagram_media_avg_engagement' DECIMAL(0,2) NOT NULL DEFAULT 0
);

CREATE TABLE 'instagram_media_engagement' (
	'instagram_media_engagement_id' INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	'instagram_media_engagement_type' VARCHAR(7) NOT NULL,
	'instagram_media_engagement_user_id' VARCHAR(32) NOT NULL,
	'instagram_media_engagement_created_datetime' DATETIME DEFAULT CURRENT_TIMESTAMP,
	'instagram_media_engagement_updated_datetime' DATETIME ON UPDATE CURRENT_TIMESTAMP,
	'media_id' INT NOT NULL,
);

CREATE TABLE 'instagram_media_engagement_cache' (
	'instagram_media_engagement_cache_id' INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	'instagram_media_engagement_cache_top_comment_user_id' VARCHAR(32) NOT NULL,
	'media'
)

CREATE TABLE 'user_score' (
	'user_score_id' INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	'user_score' DECIMAL(0,2) NOT NULL DEFAULT 0,
	'user_id' VARCHAR(32) NOT NULL DEFAULT 0
);


DELIMITER $$
CREATE TRIGGER tg_bi_table1
BEFORE INSERT ON table1
FOR EACH ROW
BEGIN
  INSERT INTO table1_seq () VALUES ();
  SET NEW.id = MD5(LAST_INSERT_ID());
END$$
DELIMITER ;