<?php

class category extends DatabaseObject
{

    protected static $table_name = "tbl_category";
    protected static $db_fields = array('id', 'title', 'fa_icon', 'parentId', 'image', 'brief', 'type', 'status', 'sortorder', 'added_date');

    var $id;
    var $title;
    var $parentId;
    var $image;
    var $brief;
    var $fa_icon;
    var $type;
    var $status;
    var $sortorder;
    var $added_date;

    //Find all by parent id the current database table.
    static function find_all_byparnt($parentId = 0, $notid = '')
    {
        global $db;
        $cond1 = !empty($notid) ? ' AND id<>' . $notid : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE parentId=$parentId $cond1 ORDER BY sortorder ASC";
        return self::find_by_sql($sql);
    }

    public static function get_category()
    {
        global $db;
        $sql = "SELECT id, title FROM " . self::$table_name . " WHERE status=1 AND parentId=0 ORDER BY sortorder DESC ";
        return self::find_by_sql($sql);
    }

    public static function get_subcategory()
    {
        global $db;
        $sql = "SELECT id, title FROM " . self::$table_name . " WHERE status=1 AND parentId!=0 ORDER BY sortorder DESC ";
        return self::find_by_sql($sql);
    }

    // Get total Child no.
    public static function getTotalChild($pid = '')
    {
        global $db;
        $query = "SELECT COUNT(id) AS tot FROM " . self::$table_name . " WHERE parentId= $pid ";
        $sql = $db->query($query);
        $ret = $db->fetch_array($sql);
        return $ret['tot'];
    }

    /************************** multi level menu by me ***************************/
    public static function get_parentList_bylevel($level = 1, $selid = 0)
    {
        global $db;
        $sql1 = "SELECT id,title FROM " . self::$table_name . " WHERE parentId='0' ORDER BY sortorder ASC";
        $result = '';
        $prodtRec1 = self::find_by_sql($sql1);

        $result .= '<select data-placeholder="None" class="chosen-select" id="parentId" name="parentId">';
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
                            /******** Third level ********/
                            if ($level != 2) {
                                $sql3 = "SELECT id,title FROM " . self::$table_name . " WHERE parentId='" . $prodtRow2->id . "' ORDER BY sortorder ASC";
                                $prodtRec3 = self::find_by_sql($sql3);
                                if ($prodtRec3):
                                    foreach ($prodtRec3 as $prodtRow3):
                                        $sel3 = ($selid == $prodtRow3->id) ? 'selected' : '';
                                        $result .= '<option value="' . $prodtRow3->id . '" ' . $sel3 . '>&nbsp;&nbsp;&nbsp;&nbsp;- ' . $prodtRow3->title . '</option>';
                                        /******** Fourth level ********/
                                        if ($level != 3) {
                                            $sql4 = "SELECT id,title FROM " . self::$table_name . " WHERE parentId='" . $prodtRow3->id . "' ORDER BY sortorder ASC";
                                            $prodtRec4 = self::find_by_sql($sql4);
                                            if ($prodtRec4):
                                                foreach ($prodtRec4 as $prodtRow4):
                                                    $sel4 = ($selid == $prodtRow4->id) ? 'selected' : '';
                                                    $result .= '<option value="' . $prodtRow4->id . '" ' . $sel4 . '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ' . $prodtRow4->title . '</option>';
                                                    /******** Fifth level ********/
                                                    if ($level != 4) {
                                                        $sql5 = "SELECT id,title FROM " . self::$table_name . " WHERE parentId='" . $prodtRow4->id . "' ORDER BY sortorder ASC";
                                                        $prodtRec5 = self::find_by_sql($sql5);
                                                        if ($prodtRec5):
                                                            foreach ($prodtRec5 as $prodtRow5):
                                                                $sel5 = ($selid == $prodtRow5->id) ? 'selected' : '';
                                                                $result .= '<option value="' . $prodtRow5->id . '" ' . $sel5 . '>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- ' . $prodtRow5->title . '</option>';
                                                            endforeach;
                                                        endif;
                                                    }
                                                endforeach;
                                            endif;
                                        }
                                    endforeach;
                                endif;
                            }
                        endforeach;
                    endif;
                }
            endforeach;
        endif;
        $result .= '</select>';
        return $result;
    }

    public static function checkDupliTitle($title = '', $pid = '', $condId = '')
    {
        global $db;
        $cond = !empty($pid) ? ' AND parentId=' . $pid : '';
        $cond2 = !empty($condId) ? ' AND id<>' . $condId : '';
        $query = $db->query("SELECT title FROM " . self::$table_name . " WHERE title='$title' $cond $cond2 LIMIT 1");
        $result = $db->num_rows($query);
        if ($result > 0) {
            return true;
        }
    }

    public static function get_internal_link($selid = '')
    {
        global $db;
        $sql = "SELECT id,title,slug FROM " . self::$table_name . " WHERE status='1' AND parentId=0 ORDER BY sortorder DESC";
        $record = self::find_by_sql($sql);
        $result = '';
        if ($record) {
            $result .= '<optgroup label="Category"> ';
            foreach ($record as $row) {
                $sel = ($selid == 'product/' . $row->slug) ? 'selected' : '';
                $result .= '<option value="product/' . $row->slug . '" ' . $sel . '>' . $row->title . '</option>';
            }
        } else {
            $result .= '</optgroup>';
        }
        return $result;
    }

    public static function get_all_selcate($actid = 0, $selid = '')
    {
        global $db;
        $sql = "SELECT id,title FROM " . self::$table_name . " WHERE parentId ='$actid' ORDER BY sortorder DESC";
        $record = self::find_by_sql($sql);
        $result = '';
        if ($record) {
            $result .= '<option value="all">Choose Sub category</option>';
            foreach ($record as $row) {
                $sel = ($selid == $row->id) ? 'selected' : '';
                $result .= '<option value="' . $row->id . '" ' . $sel . '>' . $row->title . '</option>';
            }
        } else {
            $result .= '<option value="all">Choose sub Category</option>';
        }
        return $result;
    }

    public static function get_all_homeselcate($actid = 0, $selid = '')
    {
        $result = '';
        $selectedIds = explode(',', $actid);
        if (!empty($selectedIds[0])) {
            foreach ($selectedIds as $selectedId) {
                global $db;
                $sql = "SELECT id,title FROM " . self::$table_name . " WHERE parentId ='$selectedId' ORDER BY sortorder DESC";
                $record = self::find_by_sql($sql);
                if ($record) {
                    foreach ($record as $row) {
                        $sel = ($selid == $row->id) ? 'selected' : '';
                        $tot = SubProduct::get_total_subcategory_product($row->id);
                        if ($tot > 0) {
                            $result .= '
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input qsubcategory" name="qsubcategory[]" ' . $sel . ' id="subcat-' . $row->id . '" value="' . $row->id . '">
                                <label class="custom-control-label d-flex justify-content-between" for="subcat-' . $row->id . '">' . $row->title . ' <span class="checkbox-count">' . $tot . '</span></label>
                            </div>
                            ';
                        }
                    }
                }
            }
        } else {
            $record = self::get_subcategory();
            if ($record) {
                foreach ($record as $row) {
                    $sel = ($selid == $row->id) ? 'selected' : '';
                    $tot = SubProduct::get_total_subcategory_product($row->id);
                    if ($tot > 0) {
                        $result .= '
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input qsubcategory" name="qsubcategory[]" ' . $sel . ' id="subcat-' . $row->id . '" value="' . $row->id . '">
                            <label class="custom-control-label d-flex justify-content-between" for="subcat-' . $row->id . '">' . $row->title . ' <span class="checkbox-count">' . $tot . '</span></label>
                        </div>
                        ';
                    }
                }
            }
        }
        return $result;
    }

    public static function get_all_filterdata($pId = 0, $selid = '')
    {
        global $db;
        $sql = "SELECT id,title FROM " . self::$table_name . " WHERE parentId='$pId' ORDER BY sortorder DESC";
        $record = self::find_by_sql($sql);
        $result = '';
        if ($record) {
            $result .= '<option value="0">None</option>';
            foreach ($record as $row) {
                $sel = ($selid == $row->id) ? 'selected' : '';
                $result .= '<option value="' . $row->id . '" ' . $sel . '>' . $row->title . '</option>';
            }
        } else {
            $result .= '<option value="0">None</option>';
        }
        return $result;
    }

    //FIND THE HIGHEST MAX NUMBER BY PARENT ID.
    static function find_maximum_byparent($field = "sortorder", $pid = "")
    {
        global $db;
        $result = $db->query("SELECT MAX({$field}) AS maximum FROM " . self::$table_name . " WHERE parentId={$pid}");
        $return = $db->fetch_array($result);
        return ($return) ? ($return['maximum'] + 1) : 1;
    }

    // view category Front.
    static function getcategory($limit = '')
    {
        global $db;
        $cond = !empty($limit) ? ' LIMIT ' . $limit : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE status=1 ORDER BY sortorder ASC $cond";
        return self::find_by_sql($sql);
    }

    static function get_by_id($id = 0)
    {
        global $db;
        $result_array = self::find_by_sql("SELECT title,image,fa_icon FROM " . self::$table_name . " WHERE id={$id} LIMIT 1");
        return !empty($result_array) ? array_shift($result_array) : false;
    }

    static function get_all_byparnt($parentId = 0, $notparentId = '')
    {
        global $db;
        $cond1 = !empty($notparentId) ? ' AND id<>' . $notparentId : '';
        $sql = "SELECT id,title FROM " . self::$table_name . " WHERE parentId=$parentId  AND status=1 $cond1 ORDER BY sortorder DESC";
        return self::find_by_sql($sql);
    }

    // get the category name from it's id
    static function getcategoryName($id = 0)
    {
        global $db;
        $result = $db->query("SELECT title FROM " . self::$table_name . " WHERE id='{$id}'");
        $return = $db->fetch_array($result);
        return ($return) ? $return['title'] : '';
    }

    //Find all the rows in the current database table.
    static function find_all()
    {
        global $db;
        return self::find_by_sql("SELECT * FROM " . self::$table_name . " ORDER BY sortorder DESC");
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