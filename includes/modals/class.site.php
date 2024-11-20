<?php

class Site extends DatabaseObject
{

    protected static $table_name = "tbl_sites";
    protected static $db_fields = array(
        'id', 'slug', 'title', 'parentId', 'delivery_charge', 'latitude', 'longitude', 'image', 'status', 'sortorder', 'added_date', 'modified_date', 'homepage'
    );

    public $id, $slug, $title, $parentId, $delivery_charge, $latitude, $longitude, $image, $status, $sortorder, $added_date, $modified_date, $homepage;

    public static function checkDupliName($title = '')
    {
        global $db;
        $query = $db->query("SELECT title FROM " . self::$table_name . " WHERE title='$title' LIMIT 1");
        $result = $db->num_rows($query);
        if ($result > 0) {
            return true;
        }
    }

    public static function get_locationn()
    {
        global $db;
        $sql = "SELECT id, title FROM " . self::$table_name . " WHERE status=1  ORDER BY sortorder DESC ";
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
    public static function getHomepagelocationns($limit = '')
    {
        global $db;
        $lmt = !empty($limit) ? ' LIMIT ' . $limit : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE status='1' AND homepage='1' ORDER BY sortorder DESC $lmt";
        return self::find_by_sql($sql);
    }

    static function find_all_byparnt($parentId = 0, $notid = '')
    {
        global $db;
        $cond1 = !empty($notid) ? ' AND id<>' . $notid : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE parentId=$parentId $cond1 ORDER BY sortorder ASC";
        return self::find_by_sql($sql);
    }

    // Article display
    public static function getArticle($page = "")
    {
        global $db;
        $result_array = self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE name='{$page}' AND status=1 LIMIT 1");
        return !empty($result_array) ? array_shift($result_array) : false;
    }

    static function get_all_byparnt($parentId = 0, $notparentId = '')
    {
        global $db;
        $cond1 = !empty($notparentId) ? ' AND id<>' . $notparentId : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE parentId=$parentId  AND status=1 $cond1 ORDER BY sortorder DESC";
        return self::find_by_sql($sql);
    }

    static function get_all_bychild($parentId = 0, $room = '')
    {
        global $db;
        $cond1 = !empty($room) ? ' AND id<>' . $room : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE parentId<>$parentId  AND status=1 $cond1 ORDER BY sortorder DESC";
        return self::find_by_sql($sql);
    }

    public static function getTotalChild($pid = '')
    {
        global $db;
        $query = "SELECT COUNT(id) AS tot FROM " . self::$table_name . " WHERE parentId= $pid ";
        $sql = $db->query($query);
        $ret = $db->fetch_array($sql);
        return $ret['tot'];
    }

    public static function get_parentList_bylevel($level = 1, $selid = 0)
    {
        global $db;
        $sql1 = "SELECT id,title FROM " . self::$table_name . " WHERE parentId='0' ORDER BY sortorder ASC";
        $result = '';
        $prodtRec1 = self::find_by_sql($sql1);

        $result .= '<select data-placeholder="None" class="chosen-selec" id="parentId" name="parentId">';
        $result .= '<option value="0">None</option>';
        /******** First level ********/
        if ($prodtRec1):
            foreach ($prodtRec1 as $prodtRow1):
                $sel1 = ($selid == $prodtRow1->id) ? 'selected' : '';
                $result .= '<option value="' . $prodtRow1->id . '" ' . $sel1 . '>' . $prodtRow1->title . '</option>';
                /******** Second level ********/
                if ($level != 1) {
                    $sql2 = "SELECT id,title FROM " . self::$table_name . " WHERE parentId='" . $prodtRow1->id . "' ORDER BY sortorder ASC";
                    $prodtRec2 = self::find_by_sql($sql2);
                    if ($prodtRec2):
                        foreach ($prodtRec2 as $prodtRow2):
                            $sel2 = ($selid == $prodtRow2->id) ? 'selected' : '';
                            $result .= '<option value="' . $prodtRow2->id . '" ' . $sel2 . '>&nbsp;&nbsp;- ' . $prodtRow2->title . '</option>';
                        endforeach;
                    endif;
                }
            endforeach;
        endif;
        $result .= '</select>';
        return $result;
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

    static function find_by_title($title = '')
    {
        global $db;
        $result_array = self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE title='$title' AND status='1' LIMIT 1");
        return !empty($result_array) ? array_shift($result_array) : false;
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