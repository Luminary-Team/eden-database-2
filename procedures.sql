

CREATE OR REPLACE PROCEDURE total_sale_calc(cart_id INTEGER)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    -- Verifica se existem itens no carrinho
    IF EXISTS (SELECT 1 FROM carts_itens WHERE fk_carts_id = cart_id) THEN
        -- Atualiza o total da venda com a soma dos preços dos produtos
        UPDATE carts
        SET total_sale = (
            SELECT SUM(p.price) 
            FROM products p
            JOIN carts_itens ci ON ci.fk_product_id = p.pk_id
            WHERE ci.fk_carts_id = cart_id
        )
        WHERE pk_id = cart_id;
    ELSE
        -- Se não houver itens no carrinho, define o total como 0
        UPDATE carts
        SET total_sale = 0
        WHERE pk_id = cart_id;
    END IF;
END;
$$;



CREATE OR REPLACE PROCEDURE user_rating_calc(user_id INTEGER)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM ratings WHERE fk_user_appraised_id = user_id) THEN
        UPDATE users
        SET rating = (SELECT AVG(rating) FROM ratings WHERE fk_user_appraised_id = user_id)
        WHERE pk_id = user_id;
    END IF;

END;
$$;









