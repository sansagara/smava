CREATE FUNCTION f_is_numeric(_value text)
  RETURNS boolean AS
$func$
BEGIN

RETURN _value ~ '^[0-9\.]+$'

END
$func$
LANGUAGE plpgsql;
