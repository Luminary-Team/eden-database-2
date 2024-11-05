CREATE TABLE usage_time(
    pk_id serial PRIMARY KEY,
    time varchar(45) NOT NULL,
    discount_percentage DECIMAL(10,2) NOT NULL
);

CREATE TABLE condition_types(
    pk_id serial PRIMARY KEY,
    type varchar(45) NOT NULL,
    description varchar(90) NULL
);

CREATE TABLE payments_types(
    pk_id serial PRIMARY KEY,
    type varchar(45) NOT NULL,
    description varchar(90)
);

CREATE TABLE status_orders(
    pk_id serial PRIMARY KEY,
    status varchar(45) NOT NULL,
    description varchar(90)
);

CREATE TABLE users(
    pk_id serial PRIMARY KEY,
    name varchar(45) NOT NULL,
    cpf varchar(11) NOT NULL,
    user_name varchar(45) NOT NULL,
    password varchar(100) NOT NULL,
    rating DECIMAL(10,2) NOT NULL,
    email varchar(90) NULL,
    cellphone varchar(11) NULL
);


CREATE TABLE cards(
    pk_id serial PRIMARY KEY,
    fk_user_id INTEGER NOT NULL,
    FOREIGN KEY (fk_user_id) REFERENCES users(pk_id),
    card_number VARCHAR(16) NOT NULL,
    cvv VARCHAR(3) NULL,
    cvc VARCHAR(3) NULL,
    validity VARCHAR(5) NOT NULL
);

CREATE TABLE products(
    pk_id serial PRIMARY KEY,
    fk_condition_type_id INTEGER NOT NULL,
    FOREIGN KEY (fk_condition_type_id) REFERENCES condition_types(pk_id),
    fk_user_id INTEGER NOT NULL,
    FOREIGN KEY (fk_user_id) REFERENCES users(pk_id),
    fk_usage_time_id INTEGER NOT NULL,
    FOREIGN KEY (fk_usage_time_id) REFERENCES usage_time(pk_id),
    title varchar(45) NOT NULL,
    description varchar(90) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    max_price DECIMAL(10,2) NOT NULL,
    sender_zip_code varchar(8) NOT NULL,
    rating DECIMAL(10,2) NOT null
);

CREATE TABLE categories(
    pk_id INT PRIMARY KEY,
    category varchar(45) NOT NULL,
    description varchar(45) not NULL
);

CREATE TABLE categories_of_products(
    pfk_product_id INTEGER NOT NULL,
    FOREIGN KEY (pfk_product_id) REFERENCES products(pk_id),
    pfk_category_id INTEGER NOT NULL,
    FOREIGN KEY (pfk_category_id) REFERENCES categories(pk_id),
    PRIMARY KEY (pfk_product_id, pfk_category_id)
);

CREATE TABLE carts(
    pk_id serial PRIMARY KEY,
    fk_user_id INTEGER NOT NULL,
    FOREIGN KEY (fk_user_id) REFERENCES users(pk_id)
);

CREATE TABLE carts_itens(
    pk_id serial PRIMARY KEY,
    fk_carts_id INTEGER NOT NULL,
    FOREIGN KEY (fk_carts_id) REFERENCES carts(pk_id),
    fk_product_id INTEGER NOT NULL,
    FOREIGN KEY (fk_product_id) REFERENCES products(pk_id)
);


CREATE TABLE orders(
    pk_id serial PRIMARY KEY,
    fk_status_order_id INTEGER NOT NULL,
    FOREIGN KEY (fk_status_order_id) REFERENCES status_orders(pk_id),
    fk_payment_type_id INTEGER NOT NULL,
    FOREIGN KEY (fk_payment_type_id) REFERENCES payments_types(pk_id),
    fk_user_id INTEGER NOT NULL,
    FOREIGN KEY (fk_user_id) REFERENCES users(pk_id),
    order_date TIMESTAMP NOT NULL,
    adress_delivery varchar(90) NOT NULL,
    total_sale DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders_itens(
    pk_id serial PRIMARY KEY,
    fk_order_id INTEGER NOT NULL,
    FOREIGN KEY (fk_order_id) REFERENCES orders(pk_id),
    fk_product_id INTEGER NOT NULL,
    FOREIGN KEY (fk_product_id) REFERENCES products(pk_id)
);



CREATE TABLE comments(
    pk_id serial PRIMARY KEY,
    fk_product_id INTEGER NOT NULL,
    FOREIGN KEY (fk_product_id) REFERENCES products(pk_id),
    fk_user_id INTEGER NOT NULL,
    FOREIGN KEY (fk_user_id) REFERENCES users(pk_id),
    comment varchar(90) NOT NULL
);

CREATE TABLE ecopoints(
    pk_id serial PRIMARY KEY,
    name varchar(45) NOT NULL,
    adress varchar(90) NOT NULL,
    zip_code varchar(8) NOT NULL,
    rating DECIMAL(10,2) NOT NULL
);

CREATE TABLE ratings(
    pk_id serial PRIMARY KEY,
    rating DECIMAL(10,2) NOT NULL,
    fk_user_appraiser_id INTEGER NOT NULL,
    FOREIGN KEY (fk_user_appraiser_id) REFERENCES users(pk_id),
    fk_product_id INTEGER NULL,
    FOREIGN KEY (fk_product_id) REFERENCES products(pk_id),
    fk_user_appraised_id INTEGER NULL,
    FOREIGN KEY (fk_user_appraised_id) REFERENCES users(pk_id),
    fk_ecopoint_id INTEGER NULL,
    FOREIGN KEY (fk_ecopoint_id) REFERENCES ecopoints(pk_id)
);

CREATE TABLE admin(
    pk_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
);

CREATE TABLE boost_plan(
    pk_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    duration_days INT NOT NULL
);

CREATE TABLE activate_plan (
    pk_id INT PRIMARY KEY,
    fk_product_id INT NOT NULL,
    FOREIGN KEY (fk_product_id) 
    REFERENCES products(pk_id),
    fk_user_id INT NOT NULL,
    FOREIGN KEY (fk_user_id)
    REFERENCES users(pk_id),
    fk_plan_id INT NOT NULL,
    FOREIGN KEY (fk_plan_id)
    REFERENCES boost_plan(pk_id),
    activation_date TIMESTAMP NOT NULL,
    deactivation_date DATE,
    activation_status BOOLEAN NOT NULL
);

CREATE TABLE favorites(
    fk_user_id INT NOT NULL,
    FOREIGN KEY (fk_user_id)
    REFERENCES users(pk_id),
    fk_product_id INT NOT NULL,
    FOREIGN KEY (fk_product_id)
    REFERENCES products(pk_id),
    PRIMARY KEY (fk_user_id, fk_product_id)
);

----------Log----------

    Create Table users_log(
        fk_user_id INT NULL,
        operator VARCHAR(80),
        alteration_date TIMESTAMP NOT NULL,
        operation VARCHAR(45) NOT NULL,
        delete_old INT NULL
    );

    Create Table products_log(
        fk_product_id INT NULL,
        operator VARCHAR(80),
        alteration_date TIMESTAMP NOT NULL,
        operation VARCHAR(45) NOT NULL,
        delete_old INT NULL
    );


    Create Table cards_log(
        fk_card_id INT NULL,
        operator VARCHAR(80),
        alteration_date TIMESTAMP NOT NULL,
        operation VARCHAR(45) NOT NULL,
        delete_old INT NULL
    );


    Create Table categories_log(
        fk_category_id INT NULL,
        operator VARCHAR(80),
        alteration_date TIMESTAMP NOT NULL,
        operation VARCHAR(45) NOT NULL,
        delete_old INT NULL
    );

    Create Table ratings_log(
        fk_rating_id INT NULL,
        operator VARCHAR(80),
        alteration_date TIMESTAMP NOT NULL,
        operation VARCHAR(45) NOT NULL,
        delete_old INT NULL
    );

    Create Table carts_itens_log(
        fk_carts_itens_id INT NULL,
        operator VARCHAR(80),
        alteration_date TIMESTAMP NOT NULL,
        operation VARCHAR(45) NOT NULL,
        delete_old INT NULL
    );