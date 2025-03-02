<?php

class CompanyCode extends DatabaseObject
{

    protected static $table_name = "tbl_company_codes";
    protected static $db_fields = array(
        'id', 'slug', 'title', 'code', 'address', 'latitude', 'longitude', 'status', 'sortorder', 'added_date', 'modified_date'
    );

    public $id, $slug, $title, $code, $address, $latitude, $longitude, $status, $sortorder, $added_date, $modified_date;

    public static function checkDupliName($title = '')
    {
        global $db;
        $query = $db->query("SELECT title FROM " . self::$table_name . " WHERE title='$title' LIMIT 1");
        $result = $db->num_rows($query);
        if ($result > 0) {
            return true;
        }
    }

    public static function checkDupliCode($code = '')
    {
        global $db;
        $query = $db->query("SELECT code FROM " . self::$table_name . " WHERE code='$code' LIMIT 1");
        $result = $db->num_rows($query);
        if ($result > 0) {
            return true;
        }
    }

    public static function get_brand()
    {
        global $db;
        $sql = "SELECT id, title,slug FROM " . self::$table_name . " WHERE status=1  ORDER BY title ASC ";
        return self::find_by_sql($sql);
    }

    public static function get_brand_service($serviceId = '')
    {
        global $db;
        $sql = "SELECT b.id, b.title, b.slug FROM " . self::$table_name . " AS b 
                INNER JOIN tbl_product_sub as prod ON prod.brand = b.id
                INNER JOIN tbl_services as serv ON serv.id = prod.service_id
                WHERE serv.id = {$serviceId} AND serv.status=1 AND prod.status=1 
                GROUP BY b.id 
                ORDER BY b.title ASC ";
        return self::find_by_sql($sql);
    }

    //type
    public static function get_brand_service_type($serviceId = '', $type = '')
    {
        global $db;
        $sql = "SELECT b.id, b.title, b.slug FROM " . self::$table_name . " AS b 
                INNER JOIN tbl_product_sub as prod ON prod.brand = b.id
                INNER JOIN tbl_services as serv ON serv.id = prod.service_id
                WHERE serv.id = {$serviceId} AND serv.status=1 AND prod.status=1 AND prod.type=$type 
                GROUP BY b.id 
                ORDER BY b.title ASC ";
        return self::find_by_sql($sql);
    }

    public static function get_by_type($type = "1")
    {
        global $db;
        $result_array = self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE type='$type' AND status=1 LIMIT 1");
        return !empty($result_array) ? array_shift($result_array) : false;
    }

    public static function get_by_Parent($parent = 0)
    {
        global $db;
        $sql = "SELECT id, slug, title, linksrc, linktype, content, image FROM " . self::$table_name . " WHERE status=1 AND parent_id='" . $parent . "' ORDER BY sortorder ASC";
        return self::find_by_sql($sql);
    }

    public static function getTotalSub($parent_id = '')
    {
        global $db;
        $cond = !empty($parent_id) ? ' AND parent_id=' . $parent_id : '';
        $query = "SELECT COUNT(id) AS tot FROM " . self::$table_name . " WHERE status=1 $cond ";
        $sql = $db->query($query);
        $ret = $db->fetch_array($sql);
        return $ret['tot'];
    }

    // Homepage Display
    public static function getHomepageBrands($limit = '')
    {
        global $db;
        $lmt = !empty($limit) ? ' LIMIT ' . $limit : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE status='1' AND homepage='1' ORDER BY sortorder DESC $lmt";
        return self::find_by_sql($sql);
    }

    // Article display
    public static function getArticle($page = "")
    {
        global $db;
        $result_array = self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE name='{$page}' AND status=1 LIMIT 1");
        return !empty($result_array) ? array_shift($result_array) : false;
    }

    /************************** Article menu link  by me ***************************/
    public static function get_internal_link($Lsel = '', $LType = 0)
    {
        global $db;
        $sql = "SELECT slug, title FROM " . self::$table_name . " WHERE status='1' ORDER BY sortorder ASC";
        $pages = Article::find_by_sql($sql);
        $linkpageDis = ($Lsel == 1) ? 'hide' : '';

        $result = '';
        if ($pages):
            $result .= '<optgroup label="Articles">';
            foreach ($pages as $pageRow):
                $sel = ($Lsel == $pageRow->slug) ? 'selected' : '';
                $result .= '<option value="' . $pageRow->slug . '" ' . $sel . '>&nbsp;&nbsp;' . $pageRow->title . '</option>';
            endforeach;
            $result .= '</optgroup>';
        endif;
        return $result;
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

    static function find_by_code($code = '')
    {
        global $db;
        $result_array = self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE code='$code' AND status='1' LIMIT 1");
        return !empty($result_array) ? array_shift($result_array) : false;
    }

    //Find all the rows in the current database table.
    public static function find_all_active()
    {
        global $db;
        return self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE status=1 ORDER BY sortorder DESC");
    }

    //Find a single row in the database where slug is provided.
    static function find_by_slug($slug = '')
    {
        global $db;
        $result_array = self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE slug='$slug' AND status='1' LIMIT 1");
        return !empty($result_array) ? array_shift($result_array) : false;
    }

    static function find_by_slug_type($slug = '', $type = '')
    {
        global $db;
        $result_array = self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE slug='$slug' AND type='$type' AND status='1' LIMIT 1");
        return !empty($result_array) ? array_shift($result_array) : false;
    }

    static function get_brands_by_slug($slug = '')
    {
        global $db;
        $result_array = self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE slug='$slug' LIMIT 1");
        return $result_array;
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