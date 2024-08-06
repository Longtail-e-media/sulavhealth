<?php

class Product extends DatabaseObject
{

    protected static $table_name = "tbl_product";
    protected static $db_fields = array('id', 'slug', 'title', 'title_greek', 'type', 'status', 'sortorder', 'added_date', 'modified_date');

    var $id;
    var $slug;
    var $title;
    var $title_greek;
    var $type;
    var $status;
    var $sortorder;
    var $added_date;
    var $modified_date;

    //Find a single row in the database where slug is provided.
    public static function find_by_slug($slug = 0)
    {
        global $db;
        $sql = "SELECT * FROM " . self::$table_name . " WHERE slug='$slug' LIMIT 1";
        $result_array = self::find_by_sql($sql);
        return !empty($result_array) ? array_shift($result_array) : false;
    }
   
    // view package Front.
    static function getPackage($limit = '')
    {
        global $db;
        $cond = !empty($limit) ? ' LIMIT ' . $limit : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE status=1 ORDER BY sortorder DESC $cond";
        return self::find_by_sql($sql);
    }

    // view package Front.
    static function getHomePackage($limit = '')
    {
        global $db;
        $cond = !empty($limit) ? ' LIMIT ' . $limit : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE status=1 AND type=0 ORDER BY sortorder ASC $cond";
        return self::find_by_sql($sql);
    }

    // view package Front.
    static function getPackageByType($type, $limit = '')
    {
        global $db;
        $cond = !empty($limit) ? ' LIMIT ' . $limit : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE status=1 AND type != $type ORDER BY sortorder DESC $cond";
        return self::find_by_sql($sql);
    }

    public static function checkDupliTitle($title = '')
    {
        global $db;
        $query = $db->query("SELECT title FROM " . self::$table_name . " WHERE title='$title' LIMIT 1");
        $result = $db->num_rows($query);
        if ($result > 0) {
            return true;
        }
    }

    public static function get_internal_link($Lsel = '', $Ltype = 1)
    {
        global $db;
        $sql = "SELECT slug, title FROM " . self::$table_name . " WHERE status='1' AND type='{$Ltype}' ORDER BY sortorder DESC";
        $pages = self::find_by_sql($sql);
        $linkpageDis = ($Lsel == 1) ? 'hide' : '';
        $linkProductPackage = ($Ltype == 1) ? 'shop' : 'packages';
        $linkLabel = ($Ltype == 1) ? 'Products' : 'Packages';

        $result = '';
        if ($pages):
            $result .= '<optgroup label="' . $linkLabel . '">';
            foreach ($pages as $pageRow):
                $sel = ($Lsel == $linkProductPackage.'#'.$pageRow->slug) ? 'selected' : '';
                $result .= '<option value="' . $linkProductPackage . '#' . $pageRow->slug . '" ' . $sel . '>&nbsp;&nbsp; ' . $pageRow->title . '</option>';
            endforeach;
            $result .= '</optgroup>';
        endif;
        return $result;
    }

    // view package of the nos provided.
    static function getPackageList($total = 5, $offset = 0)
    {
        global $db;
        return self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE status=1 ORDER BY sortorder ASC LIMIT {$total} OFFSET {$offset}");
    }

    //FIND THE HIGHEST MAX NUMBER.
    static function find_maximum($field = "sortorder")
    {
        global $db;
        $result = $db->query("SELECT MAX({$field}) AS maximum FROM " . self::$table_name);
        $return = $db->fetch_array($result);
        return ($return) ? ($return['maximum'] + 1) : 1;
    }


    //Find all the rows in the current database table.
    static function find_all()
    {
        global $db;
        return self::find_by_sql("SELECT * FROM " . self::$table_name . " ORDER BY sortorder DESC");
    }

    static function find_all_but($notid = '')
    {
        global $db;
        $cond = (!empty($notid)) ? ' AND id!=' . $notid : '';
        return self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE status=1 {$cond} ORDER BY sortorder DESC");
    }

    static function find_all_by_type($type = 1)
    {
        global $db;
        $cond = (!empty($type)) ? ' AND type=' . $type : '';
        return self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE status=1 {$cond} ORDER BY sortorder DESC");
    }

    //Find all the rows in the current database table.
    static function get_all()
    {
        global $db;
        $sql = "SELECT id,title FROM " . self::$table_name . " WHERE status=1 ORDER BY sortorder ASC";
        return self::find_by_sql($sql);
    }

    public static function getTotalparent()
    {
        global $db;
        $query = "SELECT COUNT(id) AS tot FROM " . self::$table_name . " WHERE status=1 ";
        $sql = $db->query($query);
        $ret = $db->fetch_array($sql);
        return $ret['tot'];
    }

    //Find a single row in the database where id is provided.
    static function find_by_id($id = 0)
    {
        global $db;
        $result_array = self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE id={$id} LIMIT 1");
        return !empty($result_array) ? array_shift($result_array) : false;
    }

    public static function field_by_id($id = 0, $fields = "")
    {
        global $db;
        $sql = "SELECT $fields FROM " . self::$table_name . " WHERE id={$id} LIMIT 1";
        $result = $db->query($sql);
        $return = $db->fetch_array($result);
        return ($return) ? $return[$fields] : '';
    }

    //Find rows from the database provided the SQL statement.
    static function find_by_sql($sql = "")
    {
        global $db;
        $result_set = $db->query($sql);
        $object_array = array();
        while ($row = $db->fetch_array($result_set)) {
            $object_array[] = self::instantiate($row);
        }
        return $object_array;
    }

    //Instantiate all the attributes of the Class.
    static function instantiate($record)
    {
        $object = new self;
        foreach ($record as $attribute => $value) {
            if ($object->has_attribute($attribute)) {
                $object->$attribute = $value;
            }
        }
        return $object;
    }

    //Check if the attribute exists in the class.
    function has_attribute($attribute)
    {
        $object_vars = $this->attributes();
        return array_key_exists($attribute, $object_vars);
    }

    //Return an array of attribute keys and thier values.
    protected function attributes()
    {
        $attributes = array();
        foreach (self::$db_fields as $field):
            if (property_exists($this, $field)) {
                $attributes[$field] = $this->$field;
            }
        endforeach;
        return $attributes;
    }

    //Prepare attributes for database.
    protected function sanitized_attributes()
    {
        global $db;
        $clean_attributes = array();
        foreach ($this->attributes() as $key => $value):
            $clean_attributes[$key] = $db->escape_value($value);
        endforeach;
        return $clean_attributes;
    }

    //Save the changes.
    function save()
    {
        return isset($this->id) ? $this->update() : $this->create();
    }

    //Add  New Row to the database
    function create()
    {
        global $db;
        $attributes = $this->sanitized_attributes();
        $sql = "INSERT INTO " . self::$table_name . "(";
        $sql .= join(", ", array_keys($attributes));
        $sql .= ") VALUES ('";
        $sql .= join("', '", array_values($attributes));
        $sql .= "')";
        if ($db->query($sql)) {
            $this->id = $db->insert_id();
            return true;
        } else {
            return false;
        }
    }

    //Update a row in the database.
    function update()
    {
        global $db;
        $attributes = $this->sanitized_attributes();
        $attribute_pairs = array();

        foreach ($attributes as $key => $value):
            $attribute_pairs[] = "{$key}='{$value}'";
        endforeach;

        $sql = "UPDATE " . self::$table_name . " SET ";
        $sql .= join(", ", array_values($attribute_pairs));
        $sql .= " WHERE id=" . $db->escape_value($this->id);
        $db->query($sql);
        return ($db->affected_rows() == 1) ? true : false;
        //return true;
    }
}

?>