DO $$ 
DECLARE 
    n INT;
BEGIN 
    FOR n IN 1..19 LOOP
        EXECUTE 
        'INSERT INTO public."Histograma" 
        (SELECT "participante", row_number() OVER (ORDER BY "R' || n || '" DESC) ,
         ' || n || ',
         "R' || n || '"  
        FROM public."TurnoUm" ORDER BY "R' || n || '" DESC)';
    END LOOP;
END $$;
