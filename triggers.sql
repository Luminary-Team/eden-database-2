----------USERS
CREATE OR REPLACE FUNCTION func_user_log() RETURNS trigger AS $$
DECLARE 
    operator VARCHAR(80);
BEGIN 
    operator := current_user;
    
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO users_log (fk_user_id, operator, alteration_date, operation, delete_old) 
        VALUES (NEW.pk_id, operator, current_timestamp, TG_OP, NULL);
        
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO users_log (fk_user_id, operator, alteration_date, operation, delete_old) 
        VALUES (NEW.pk_id, operator, current_timestamp, TG_OP, OLD.pk_id);
        
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO users_log (fk_user_id, operator, alteration_date, operation, delete_old) 
        VALUES (NULL, operator, current_timestamp, TG_OP, OLD.pk_id);
    END IF;
    
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;


CREATE trigger trg_user_log 
AFTER INSERT OR UPDATE OR DELETE ON users
for each row execute PROCEDURE func_user_log();

--------PRODUCTS

CREATE OR REPLACE FUNCTION func_product_log() 
RETURNS trigger AS $$
DECLARE 
    operator VARCHAR(80);
BEGIN 
    operator := current_user;

    IF (TG_OP = 'INSERT') THEN
        INSERT INTO products_log (fk_product_id, operator, alteration_date, operation, delete_old) 
        VALUES (NEW.pk_id, operator, current_timestamp, TG_OP, NULL);
        
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO products_log (fk_product_id, operator, alteration_date, operation, delete_old) 
        VALUES (NEW.pk_id, operator, current_timestamp, TG_OP, OLD.pk_id);
        
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO products_log (fk_product_id, operator, alteration_date, operation, delete_old) 
        VALUES (NULL, operator, current_timestamp, TG_OP, OLD.pk_id);
    END IF;
    
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;


CREATE trigger trg_product_log 
AFTER INSERT OR UPDATE OR DELETE ON products
for each row execute PROCEDURE func_product_log();


--------CARDS

CREATE OR REPLACE FUNCTION func_card_log() 
RETURNS trigger AS $$
DECLARE 
    operator VARCHAR(80);
BEGIN 
    operator := current_user;

    IF (TG_OP = 'INSERT') THEN
        INSERT INTO cards_log (fk_card_id, operator, alteration_date, operation, delete_old) 
        VALUES (NEW.pk_id, operator, current_timestamp, TG_OP, NULL);
        
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO cards_log (fk_card_id, operator, alteration_date, operation, delete_old) 
        VALUES (NEW.pk_id, operator, current_timestamp, TG_OP, OLD.pk_id);
        
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO cards_log (fk_card_id, operator, alteration_date, operation, delete_old) 
        VALUES (NULL, operator, current_timestamp, TG_OP, OLD.pk_id);
    END IF;
    
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;


CREATE trigger trg_card_log 
AFTER INSERT OR UPDATE OR DELETE ON cards
for each row execute PROCEDURE func_card_log();

--------CATEGORIES

CREATE OR REPLACE FUNCTION func_category_log() 
RETURNS trigger AS $$
DECLARE 
    operator VARCHAR(80);
BEGIN 
    operator := current_user;

    IF (TG_OP = 'INSERT') THEN
        INSERT INTO categories_log (fk_category_id, operator, alteration_date, operation, delete_old) 
        VALUES (NEW.pk_id, operator, current_timestamp, TG_OP, NULL);
        
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO categories_log (fk_category_id, operator, alteration_date, operation, delete_old) 
        VALUES (NEW.pk_id, operator, current_timestamp, TG_OP, OLD.pk_id);
        
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO categories_log (fk_category_id, operator, alteration_date, operation, delete_old) 
        VALUES (NULL, operator, current_timestamp, TG_OP, OLD.pk_id);
    END IF;
    
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;


CREATE trigger trg_category_log 
AFTER INSERT OR UPDATE OR DELETE ON categories
for each row execute PROCEDURE func_category_log();

----------RATINGS

CREATE OR REPLACE FUNCTION func_rating_log() 
RETURNS trigger AS $$
DECLARE 
    operator VARCHAR(80);
BEGIN 
    operator := current_user;

    IF (TG_OP = 'INSERT') THEN
        INSERT INTO ratings_log (fk_rating_id, operator, alteration_date, operation, delete_old) 
        VALUES (NEW.pk_id, operator, current_timestamp, TG_OP, NULL);
        
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO ratings_log (fk_rating_id, operator, alteration_date, operation, delete_old) 
        VALUES (NEW.pk_id, operator, current_timestamp, TG_OP, OLD.pk_id);
        
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO ratings_log (fk_rating_id, operator, alteration_date, operation, delete_old) 
        VALUES (NULL, operator, current_timestamp, TG_OP, OLD.pk_id);
    END IF;
    
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;


CREATE trigger trg_rating_log 
AFTER INSERT OR UPDATE OR DELETE ON ratings
for each row execute PROCEDURE func_rating_log();

----------CARTS_ITEMS

CREATE OR REPLACE FUNCTION func_carts_iten_log() 
RETURNS trigger AS $$
DECLARE 
    operator VARCHAR(80);
BEGIN 
    operator := current_user;

    IF (TG_OP = 'INSERT') THEN
        INSERT INTO carts_itens_log (fk_carts_itens_id, operator, alteration_date, operation, delete_old) 
        VALUES (NEW.pk_id, operator, current_timestamp, TG_OP, NULL);
        
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO carts_itens_log (fk_carts_itens_id, operator, alteration_date, operation, delete_old) 
        VALUES (NEW.pk_id, operator, current_timestamp, TG_OP, OLD.pk_id);
        
    ELSIF (TG_OP = 'DELETE') THEN
        INSERT INTO carts_itens_log (fk_carts_itens_id, operator, alteration_date, operation, delete_old) 
        VALUES (NULL, operator, current_timestamp, TG_OP, OLD.pk_id);
    END IF;
    
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;


CREATE trigger trg_carts_iten_log 
AFTER INSERT OR UPDATE OR DELETE ON carts_itens
for each row execute PROCEDURE func_carts_iten_log();
