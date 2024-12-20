<?php

class SubProduct extends DatabaseObject
{
    protected static $table_name = "tbl_product_sub";
    protected static $db_fields = array(
        'id', 'slug', 'title', 'title_greek', 'tag', 'currency', 'banner_image',
        'netqnt1', 'qnt1', 'price1', 'discount1', 'netqnt2', 'qnt2', 'price2', 'discount2', 'netqnt3', 'qnt3', 'price3', 'discount3',
        'netqnt4', 'qnt4', 'price4', 'discount4', 'brief', 'brief_greek', 'content', 'content_greek', 'status', 'sortorder', 'added_date', 'modified_date', 'brand', 'Subcategory', 'Category', 'homepage',
        'meta_title', 'meta_keywords', 'meta_description', 'meta_title_greek', 'meta_keywords_greek', 'meta_description_greek', 'type', 'service_id', 'discountedp', 'additional',
        'sizes'
    );

    // Netqnt is the net weight shown to the customer
    // qnt is the gross weight used for price calculation, not shown to customer

    public
        $id, $slug, $title, $title_greek, $tag, $currency, $banner_image,
        $netqnt1, $qnt1, $price1, $discount1, $netqnt2, $qnt2, $price2, $discount2, $netqnt3, $qnt3, $price3, $discount3,
        $netqnt4, $qnt4, $price4, $discount4, $brief, $brief_greek, $content, $content_greek, $status, $sortorder, $added_date, $modified_date,
        $meta_title, $Category, $Subcategory, $brand, $homepage, $meta_keywords, $meta_description, $meta_title_greek, $meta_keywords_greek, $meta_description_greek, $type, $additional,
        $service_id, $discountedp, $sizes;


    //Get Facility Ttle
    public static function getFacility()
    {
        global $db;
        $sql = "SELECT facility_title FROM " . self::$table_name . " WHERE status=1 ORDER BY sortorder ASC";
        return self::find_by_sql($sql);
    }


    // Homepage Display
	public static function menuproduct($Category='', $Subcategory='', $service_id='') {
		global $db;
		$sql='';
		$lmt = !empty($limit)?' LIMIT '.$limit:'';
		$sql .= "SELECT * FROM ".self::$table_name." WHERE status='1' AND (Category='$Category' OR Subcategory='$Subcategory' OR service_id='$service_id')";
		if(!empty($Category!=0)){
		$sql .="AND (Category<>0)";
	}
	elseif(!empty($Subcategory!=0)){
		$sql .="AND (Category<>0)";
	}
	elseif(!empty($service_id!=0)){
		$sql .="AND (service_id<>0)";
	}
	elseif(!empty($Subcategory!=0 AND $service_id!=0)){
		$sql .="AND (service_id<>0 AND Subcategory<>0)";
	}
	elseif(!empty($Category!=0 AND $service_id!=0)){
		$sql .="(service_id<>0 AND Category<>0)";
	}
	elseif(!empty($Category!=0 AND $Subcategory!=0)){
		$sql .="(Subcategory<>0 AND Category<>0)";
	}
	elseif(!empty($Category!=0 AND $Subcategory!=0 AND $service_id!=0)){
		$sql .="AND (Subcategory<>0 AND Category<>0 AND service_id<>0)";
	}
	$sql .="ORDER BY sortorder ASC LIMIT 4";

		return self::find_by_sql($sql);
	}

    public static function get_total_category_product($id = '')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND Category=$id ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND br.status=1 AND prod.Category=$id GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }

    public static function get_total_category_product_type($id = '',$type = '')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND Category=$id ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND prod.type=$type AND br.status=1 AND prod.Category=$id GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }

    public static function get_total_category_brand_product($brandId = '', $categoryId = '')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND brand=$brandId AND Category=$categoryId ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND br.status=1 AND prod.Category=$categoryId AND prod.brand=$brandId GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }


    public static function get_total_category_brand_product_type($brandId = '', $categoryId = '', $type = '')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND brand=$brandId AND Category=$categoryId ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND prod.type=$type AND br.status=1 AND prod.Category=$categoryId AND prod.brand=$brandId GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }

    public static function get_total_category_product_service($catid = '', $servid = '')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND Category=$catid AND service_id=$servid ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND br.status=1 AND prod.Category=$catid AND prod.service_id=$servid GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }
    //type
    public static function get_total_category_product_service_type($catid = '', $servid = '', $type = '')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND Category=$catid AND service_id=$servid ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND prod.type=$type AND br.status=1 AND prod.Category=$catid AND prod.service_id=$servid GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }


    public static function get_total_service_product_service($catid = '', $servid = '')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND Category=$catid AND service_id=$servid ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND br.status=1 AND prod.Category=$catid AND prod.service_id=$servid GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }



    public static function get_total_subcategory_product($id = '')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND Subcategory=$id ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND br.status=1 AND prod.Subcategory=$id GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }

    //type
    public static function get_total_subcategory_product_type($id = '',$type='')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND Subcategory=$id ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND prod.type=$type AND br.status=1 AND prod.Subcategory=$id GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }

    public static function get_total_subcategory_brand_product($brandId = '', $subCategoryId = '')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND brand=$brandId AND Subcategory=$subCategoryId ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND br.status=1 AND prod.brand=$brandId AND prod.Subcategory=$subCategoryId GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }

    //type
    public static function get_total_subcategory_brand_product_type($brandId = '', $subCategoryId = '', $type='')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND brand=$brandId AND Subcategory=$subCategoryId ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND prod.type=$type AND br.status=1 AND prod.brand=$brandId AND prod.Subcategory=$subCategoryId GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }

    public static function get_total_subcategory_product_service($catid = '', $servid = '')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND Subcategory=$catid AND service_id=$servid ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND br.status=1 AND prod.Subcategory=$catid AND prod.service_id=$servid GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }

    //type
    public static function get_total_subcategory_product_service_type($catid = '', $servid = '', $type = '')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND Subcategory=$catid AND service_id=$servid ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND prod.type=$type AND br.status=1 AND prod.Subcategory=$catid AND prod.service_id=$servid GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }



    public static function get_total_brand_product($id = '')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND brand=$id ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND br.status=1 AND prod.brand=$id GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }

    //type
    public static function get_total_brand_product_type($id = '', $type='')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND brand=$id ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND prod.type=$type AND br.status=1 AND prod.brand=$id GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }

    public static function get_total_brand_product_service($brandId = '', $seriveId = '')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND brand=$brandId AND service_id=$seriveId ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND br.status=1 AND prod.brand=$brandId AND prod.service_id=$seriveId GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }


    //type
    public static function get_total_brand_product_service_type($brandId = '', $seriveId = '', $type = '')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND brand=$brandId AND service_id=$seriveId ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND prod.type=$type AND br.status=1 AND prod.brand=$brandId AND prod.service_id=$seriveId GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }

    public static function get_home_brand_product_service( $seriveId = '')
    {
        global $db;
//        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND brand=$brandId AND service_id=$seriveId ORDER BY sortorder DESC ";
        // $sql = "SELECT * FROM " . self::$table_name . " WHERE status=1 AND homepage=1 AND service_id=$seriveId ORDER BY sortorder DESC limit 8";
        $sql = "SELECT * FROM " . self::$table_name . " WHERE status=1  AND service_id=$seriveId ORDER BY sortorder DESC limit 8";
        $tot = $db->num_rows($db->query($sql));
        return self::find_by_sql($sql);
    }

    public static function get_total_service_product($id = '')
    {
        global $db;
//         $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND service_id=$id ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND br.status=1 AND prod.service_id=$id GROUP BY prod.id ORDER BY prod.sortorder DESC";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }

    public static function get_total_service_product_type($id = '',$type = '')
    {
        global $db;
//         $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND service_id=$id ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND prod.type=$type AND br.status=1 AND prod.service_id=$id GROUP BY prod.id ORDER BY prod.sortorder DESC";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }


    public static function get_total_service_brand_product($brandId = '', $servid = '')
    {
        global $db;
        // $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND brand=$brandId AND service_id=$servid ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND br.status=1 AND prod.brand=$brandId AND prod.service_id=$servid GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }

    public static function get_total_service_brand_product_type($brandId = '', $servid = '', $type = '')
    {
        global $db;
        // $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND brand=$brandId AND service_id=$servid ORDER BY sortorder DESC ";
        $sql = "SELECT prod.id FROM " . self::$table_name . " AS prod INNER JOIN tbl_brands as br ON br.id = prod.brand WHERE prod.status=1 AND br.status=1 AND prod.brand=$brandId AND prod.service_id=$servid AND prod.type=$type GROUP BY prod.id ORDER BY prod.sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }

    public static function get_max_price()
    {
        global $db;
        /*return self::find_by_sql("SELECT price1 , discount1
        FROM " . self::$table_name . "
        WHERE price1 = (
            SELECT MAX(price1)
            FROM " . self::$table_name . "  WHERE status = 1
        ) OR discount1 = (
            SELECT MAX(discount1)
            FROM " . self::$table_name . " WHERE status = 1
        )");*/

        return self::find_by_sql("SELECT price1 , discount1
        FROM " . self::$table_name . "
        WHERE price1 = (
            SELECT MAX(prod.price1) FROM " . self::$table_name . " AS prod
            INNER JOIN tbl_brands as br ON br.id = prod.brand  
            WHERE prod.status = 1 AND br.status = 1
        ) OR discount1 = (
            SELECT MAX(prod.discount1) FROM " . self::$table_name . " AS prod
            INNER JOIN tbl_brands as br ON br.id = prod.brand  
            WHERE prod.status = 1 AND br.status = 1
        )");
    }

    public static function get_max_price_by_field($field='',$id='')
    {
        global $db;
        /* return self::find_by_sql("SELECT price1 , discount1
        FROM " . self::$table_name . "
        WHERE price1 = (
            SELECT MAX(price1)
            FROM " . self::$table_name . " WHERE {$field}={$id} AND status = 1
        ) OR discount1 = (
            SELECT MAX(discount1)
            FROM " . self::$table_name . " WHERE {$field}={$id} AND status = 1
        )"); */

        return self::find_by_sql("SELECT price1 , discount1
        FROM " . self::$table_name . "
        WHERE price1 = (
            SELECT MAX(prod.price1) FROM " . self::$table_name . " AS prod
            INNER JOIN tbl_brands AS br ON br.id = prod.brand
            WHERE prod.{$field}={$id} AND prod.status = 1 AND br.status = 1
        ) OR discount1 = (
            SELECT MAX(prod.discount1) FROM " . self::$table_name . " AS prod
            INNER JOIN tbl_brands AS br ON br.id = prod.brand
            WHERE prod.{$field}={$id} AND prod.status = 1 AND br.status = 1
        )");
    }

    public static function get_min_price()
    {
        global $db;
        return self::find_by_sql("SELECT price1 , discount1
        FROM " . self::$table_name . "
        WHERE price1 = (
            SELECT MIN(prod.price1)  FROM " . self::$table_name . " AS prod
            INNER JOIN tbl_brands as br on br.id = prod.brand 
            WHERE prod.price1 IS NOT NULL AND prod.price1 <> 0 AND prod.status = 1 AND br.status = 1
        ) OR discount1 = (
            SELECT MIN(prod.discount1) FROM " . self::$table_name . " AS prod
            INNER JOIN tbl_brands as br on br.id = prod.brand  
            WHERE prod.discount1 IS NOT NULL AND prod.discount1 <> 0 AND prod.status = 1 AND br.status = 1
        )");
    }

    public static function get_min_price_by_field($field='',$id='')
    {
        global $db;
        return self::find_by_sql("SELECT price1 , discount1
        FROM " . self::$table_name . "
        WHERE price1 = (
            SELECT MIN(prod.price1) FROM " . self::$table_name . " AS prod 
            INNER JOIN tbl_brands AS br ON br.id = prod.brand
            WHERE prod.price1 IS NOT NULL AND prod.price1 <> 0 
            AND prod.{$field}={$id} AND prod.status = 1 AND br.status = 1
        ) OR discount1 = (
            SELECT MIN(prod.discount1) FROM " . self::$table_name . " AS prod 
            INNER JOIN tbl_brands AS br ON br.id = prod.brand
            WHERE prod.discount1 IS NOT NULL AND prod.discount1 <> 0 
            AND prod.{$field}={$id} AND prod.status = 1 AND br.status = 1
        )");
    }

    public static function get_type()
    {
        global $db;
        $sql = "SELECT id, title FROM " . self::$table_name . " WHERE status=1 ORDER BY sortorder DESC ";
        return self::find_by_sql($sql);
    }

    public static function get_total_type_product($id = '')
    {
        global $db;
        $sql = "SELECT id FROM " . self::$table_name . " WHERE status=1 AND type=$id  ORDER BY sortorder DESC ";
        $tot = $db->num_rows($db->query($sql));
        return $tot;
    }

    //Find a single row in the database where slug is provided.
    public static function find_by_slug($slug = 0)
    {
        global $db;
        $sql = "SELECT * FROM " . self::$table_name . " WHERE slug='$slug' LIMIT 1";
        $result_array = self::find_by_sql($sql);
        return !empty($result_array) ? array_shift($result_array) : false;
    }

    // homepage package list
    public static function getPackage_limit($type = 0, $limit = '')
    {
        global $db;
        $cond = !empty($limit) ? ' LIMIT ' . $limit : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE type=$type AND status=1 ORDER BY sortorder DESC $cond ";
        return self::find_by_sql($sql);
    }

    // Homepage Display
    public static function getHomepageProducts($limit = '')
    {
        global $db;
        $lmt = !empty($limit) ? ' LIMIT ' . $limit : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE status='1' AND homepage='1' ORDER BY sortorder DESC $lmt";
        return self::find_by_sql($sql);
    }

    public static function getPackage_limits($type = 0, $limit = '', $id = 0)
    {
        global $db;
        $cond2 = !empty($id) ? ' AND id<>' . $id : '';
        $cond = !empty($limit) ? ' LIMIT ' . $limit : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE type='$type' $cond2 AND status='1' ORDER BY sortorder DESC $cond ";
        return self::find_by_sql($sql);
    }


    public static function getTotalSub($type = '')
    {
        global $db;
        $cond = !empty($type) ? ' AND type=' . $type : '';
        $query = "SELECT COUNT(id) AS tot FROM " . self::$table_name . " WHERE status=1 $cond ";
        $sql = $db->query($query);
        $ret = $db->fetch_array($sql);
        return $ret['tot'];
    }

    public static function get_relatedpkg($type = '', $notid = '', $limit = '')
    {
        global $db;
        $cond = !empty($type) ? ' AND type=' . $type : '';
        $cond2 = !empty($notid) ? ' AND id<>' . $notid : '';
        $cond3 = !empty($limit) ? ' LIMIT ' . $limit : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE status=1 $cond $cond2 ORDER BY sortorder DESC " . $cond3;
        return self::find_by_sql($sql);
    }

    public static function get_relatedprod($service = '', $notid = '', $limit = '')
    {
        global $db;
        $cond = !empty($service) ? ' AND service_id=' . $service : '';
        $cond2 = !empty($notid) ? ' AND id<>' . $notid : '';
        $cond3 = !empty($limit) ? ' LIMIT ' . $limit : '';
        $sql = "SELECT * FROM " . self::$table_name . " WHERE status=1 $cond $cond2 ORDER BY sortorder DESC " . $cond3;
        return self::find_by_sql($sql);
    }

    //FIND THE HIGHEST MAX NUMBER BY PARENT ID.
    static function find_maximum_byparent($field = "sortorder", $pid = "")
    {
        global $db;
        $result = $db->query("SELECT MAX({$field}) AS maximum FROM " . self::$table_name . " WHERE type={$pid}");
        $return = $db->fetch_array($result);
        return ($return) ? ($return['maximum'] + 1) : 1;
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

    public static function getallPackage()
    {
        global $db;
        return self::find_by_sql("SELECT * FROM " . self::$table_name . " WHERE status=1 ORDER BY sortorder DESC");
    }

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
