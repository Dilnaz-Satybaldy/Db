CREATE DATABASE lab_1;

CREATE TABLE IF NOT EXISTS users(
    id   SERIAL,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50)
);


ALTER TABLE users
    ADD COLUMN isadmin INTEGER
        CHECK(isadmin = 1 or isadmin = 0);


ALTER TABLE users
    DROP CONSTRAINT IF EXISTS users_isadmin_check;
ALTER TABLE users ALTER COLUMN isadmin TYPE boolean
USING CASE
    WHEN isadmin = 1 THEN TRUE
    WHEN isadmin = 0 THEN FALSE
    ELSE NULL
END;


ALTER TABLE users
    ALTER COLUMN isadmin SET default TRUE;


ALTER TABLE users
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


CREATE TABLE tasks(
    order_id    SERIAL,
    order_name  VARCHAR(50),
    user_id SERIAL REFERENCES users(id)
);


DROP TABLE tasks;

DROP DATABASE IF EXISTS lab_1;


DROP TABLE users;

ALTER TABLE users
    DROP COLUMN isadmin;