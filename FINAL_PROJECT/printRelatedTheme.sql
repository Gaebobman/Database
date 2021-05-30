-- ③    주제별 관련주제 출력 (주제, 관련주제). 이때, 관련 주제가 여러 개인 경우 포함.
SET SERVEROUTPUT ON
DECLARE
x_theme	varchar(40);
x_theme_ID varchar(4);
x_rel_theme varchar(40);
x_rel_theme_ID varchar(4);

CURSOR themeCursor is
    SELECT ID, theme
    from theme;

CURSOR relatedThemeCursor is
    SELECT related_theme.rel_theme_ID
    FROM theme, related_theme
    WHERE theme.ID = x_theme_ID
    AND theme.ID = related_theme.main_theme_ID;

CURSOR getThemeNameCursor is
    SELECT theme
    FROM theme
    WHERE theme.ID = x_rel_theme_ID;

BEGIN
    OPEN themeCursor;
    LOOP
        FETCH themeCursor INTO x_theme_ID, x_theme;
        EXIT WHEN themeCursor%NOTFOUND;
        dbms_output.put(x_theme||'의 관련주제: ');

        OPEN relatedThemeCursor;
        LOOP
        FETCH relatedThemeCursor INTO x_rel_theme_ID;
        EXIT WHEN relatedThemeCursor%NOTFOUND;
            
            OPEN getThemeNameCursor;
            LOOP
            FETCH getThemeNameCursor INTO x_rel_theme;
            EXIT WHEN getThemeNameCursor%NOTFOUND;
            dbms_output.put(x_rel_theme||' ');
            END LOOP;
            CLOSE getThemeNameCursor;
        END LOOP;
        CLOSE relatedThemeCursor;
        dbms_output.new_line;
    END LOOP;
    CLOSE themeCursor;
END;