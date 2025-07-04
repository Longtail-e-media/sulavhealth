<?php

class Services extends DatabaseObject
{

    protected static $table_name = "tbl_services";
    protected static $db_fields = array('id', 'slug', 'title', 'title_greek', 'icon', 'content', 'content_greek', 'status', 'homepage', 'sortorder', 'meta_title', 'meta_keywords', 'meta_description');

    public $id;
    public $slug;
    public $title;
    public $homepage;
    public $title_greek;
    public $icon;
    public $content;
    public $content_greek;
    public $status;
    public $sortorder;
    public $meta_title;
    public $meta_keywords;
    public $meta_description;

    //Find all published rows in the current database table.
    public static function getservice_list($limit = '')
    {
        global $db;
        $lmt = !empty($limit) ? ' LIMIT ' . $limit : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE status='1' ORDER BY sortorder DESC $lmt";
        return self::find_by_sql($sql);
    }

    public static function get_services()
    {
        global $db;
        $sql = "SELECT id, title FROM " . self::$table_name . " WHERE status=1  ORDER BY title ASC ";
        return self::find_by_sql($sql);
    }
    public static function get_services_home()
    {
        global $db;
        $sql = "SELECT id, title FROM " . self::$table_name . " WHERE status=1 AND homepage=1 ORDER BY sortorder ASC ";
        return self::find_by_sql($sql);
    }

    static function get_services_by_slug($slug = '')
    {
        global $db;
        $result_array = self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE slug='$slug' LIMIT 1");
        return $result_array;
    }
    static function get_services_by_slug_and_type($slug = '')
    {
        global $db;
        $result_array = self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE slug='$slug' LIMIT 1");
        return $result_array;
    }
    
    public static function get_services_by_brand($brandId = '')
    {
        global $db;
        $sql = "SELECT s.id, s.title, s.slug FROM " . self::$table_name . " AS s 
                INNER JOIN tbl_product_sub as prod ON prod.service_id = s.id
                INNER JOIN tbl_brands as b ON b.id = prod.brand
                WHERE b.id = {$brandId} AND s.status=1 AND prod.status=1 
                GROUP BY s.id 
                ORDER BY s.title ASC ";
        return self::find_by_sql($sql);
    }

    public static function checkDupliName($title = '')
    {
        global $db;
        $query = $db->query("SELECT title FROM " . self::$table_name . " WHERE title='$title' LIMIT 1");
        $result = $db->num_rows($query);
        if ($result > 0) {
            return true;
        }
    }

    //FIND THE HIGHEST MAX NUMBER.
    public static function find_maximum($field = "sortorder")
    {
        global $db;
        $result = $db->query("SELECT MAX({$field}) AS maximum FROM " . self::$table_name);
        $return = $db->fetch_array($result);
        return ($return) ? ($return['maximum'] + 1) : 1;
    }

    //Find all the rows in the current database table.
    public static function find_all()
    {
        global $db;
        return self::find_by_sql("SELECT * FROM " . self::$table_name . " ORDER BY sortorder ASC");
    }

    //Find a single row in the database where slug is provided.
    static function find_by_slug($slug = '')
    {
        global $db;
        $result_array = self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE slug='$slug' LIMIT 1");
        return !empty($result_array) ? array_shift($result_array) : false;
    }

    public static function get_internal_link($selid = '')
    {
        global $db;
        $sql = "SELECT id,title,slug FROM " . self::$table_name . " WHERE status='1' ORDER BY sortorder DESC";
        $record = self::find_by_sql($sql);
        $result = '';
        if ($record) {
            $result .= '<optgroup label="Services"> ';
            foreach ($record as $row) {
                $sel = ($selid == 'product/' . $row->slug) ? 'selected' : '';
                $result .= '<option value="product/' . $row->slug . '" ' . $sel . '>' . $row->title . '</option>';
            }
        } else {
            $result .= '</optgroup>';
        }
        return $result;
    }

    public static function get_internal_link_product($selid = '')
    {
        global $db;
        $sql = "SELECT id,title,slug FROM " . self::$table_name . " WHERE status='1' ORDER BY title ASC";
        $record = self::find_by_sql($sql);
        $result = '';
        if ($record) {
            $result .= '<option value="0">Select Service</option>';
            foreach ($record as $row) {
                $sel = ($selid == $row->id) ? 'selected' : '';
                $result .= '<option value="' . $row->id . '" ' . $sel . '>' . $row->title . '</option>';
            }
        } else {
            $result .= '<option value="0">None</option>';
        }
        return $result;
    }

    //Get sortorder by id
    public static function field_by_id($id = 0, $fields = "")
    {
        global $db;
        $sql = "SELECT $fields FROM " . self::$table_name . " WHERE id={$id} LIMIT 1";
        $result = $db->query($sql);
        $return = $db->fetch_array($result);
        return ($return) ? $return[$fields] : '';
    }

    //Find a single row in the database where id is provided.
    public static function find_by_id($id = 0)
    {
        global $db;
        $result_array = self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE id={$id} LIMIT 1");
        return !empty($result_array) ? array_shift($result_array) : false;
    }

    //Find rows from the database provided the SQL statement.
    public static function find_by_sql($sql = "")
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
    private static function instantiate($record)
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
    private function has_attribute($attribute)
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
    public function save()
    {
        return isset($this->id) ? $this->update() : $this->create();
    }

    //Add  New Row to the database
    public function create()
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
    public function update()
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