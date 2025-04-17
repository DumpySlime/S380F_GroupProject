INSERT INTO users VALUES ('keith', '$2a$12$lWXThOy4ejTl1fTACmCtCetdhH5MhXSEZrZXQxeYILNR6XEyY8hQu', 'keith smith', 'keith@gmail.com', '12345678');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_USER');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_ADMIN');

INSERT INTO users(username, password, full_name, email, phone) VALUES ('john', '$2a$12$0nePg82f2Fb472SNE.dXaOBaPslpe0zCaHtS00o4cQXIBtuMVjDcS', 'john kennith', 'john@gmail.com', '11111111');
INSERT INTO user_roles(username, role) VALUES ('john', 'ROLE_ADMIN');

INSERT INTO users(username, password, full_name, email, phone) VALUES ('mary', '$2a$12$RJQ2Lvp3nTKg6k0j/7Y0MO.OiENXsKbtc17Vs1dpjo27Mqi/eidpS', 'mary jane', 'mary@gmail.com', '01234567');
INSERT INTO user_roles(username, role) VALUES ('mary', 'ROLE_USER');