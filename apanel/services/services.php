<link href="<?php echo ASSETS_PATH; ?>uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<?php
$moduleTablename  = "tbl_services"; // Database table name
$moduleId 		  = 14;				// module id >>>>> tbl_modules

if(isset($_GET['page']) && $_GET['page'] == "services" && isset($_GET['mode']) && $_GET['mode']=="list"):	
// clearImages($moduleTablename, "services");
// clearImages($moduleTablename, "services/thumbnails");
?>
<h3>
List Services
<a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);" onClick="AddNewServices();">
    <span class="glyph-icon icon-separator">
    	<i class="glyph-icon icon-plus-square"></i>
    </span>
    <span class="button-content"> Add New </span>
</a>
</h3>
<div class="my-msg"></div>
<div class="example-box">
    <div class="example-code">    
    <table cellpadding="0" cellspacing="0" border="0" class="table" id="example">
        <thead>
            <tr>
               <th style="display:none;"></th>
               <th class="text-center"><input class="check-all" type="checkbox" /></th>
               <th>Title</th>    
               <th class="text-center"><?php echo $GLOBALS['basic']['action'];?></th>
            </tr>
        </thead> 
            
        <tbody>
            <?php $records = Services::find_by_sql("SELECT * FROM ".$moduleTablename." ORDER BY sortorder DESC ");	
				  foreach($records as $key=>$record): ?>    
            <tr id="<?php echo $record->id;?>">
            	<td style="display:none;"><?php echo $key+1;?></td>
                <td><input type="checkbox" class="bulkCheckbox" bulkId="<?php echo $record->id;?>" /></td>
                <td><div class="col-md-7">
                    <a href="javascript:void(0);" onClick="editRecord(<?php echo $record->id;?>);" class="loadingbar-demo" title="<?php echo $record->title;?>"><?php echo $record->title;?></a>
                    </div>
                </td>        
                <td class="text-center">
					<?php	
                        $statusImage = ($record->status == 1) ? "bg-green" : "bg-red" ; 
                        $statusText = ($record->status == 1) ? $GLOBALS['basic']['clickUnpub'] : $GLOBALS['basic']['clickPub'] ; 
                    ?>                                             
                    <a href="javascript:void(0);" class="btn small <?php echo $statusImage;?> tooltip-button statusToggler" data-placement="top" title="<?php echo $statusText;?>" status="<?php echo $record->status;?>" id="imgHolder_<?php echo $record->id;?>" moduleId="<?php echo $record->id;?>">
                        <i class="glyph-icon icon-flag"></i>
                    </a>
                    <a href="javascript:void(0);" class="loadingbar-demo btn small bg-blue-alt tooltip-button" data-placement="top" title="Edit" onclick="editRecord(<?php echo $record->id;?>);">
                        <i class="glyph-icon icon-edit"></i>
                    </a>
                    <a href="javascript:void(0);" class="btn small bg-red tooltip-button" data-placement="top" title="Remove" onclick="recordDelete(<?php echo $record->id;?>);">
                        <i class="glyph-icon icon-remove"></i>
                    </a>
					<input name="sortId" type="hidden" value="<?php echo $record->id;?>">
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    </div>
    <div class="pad0L col-md-2">
    <select name="dropdown" id="groupTaskField" class="custom-select">
        <option value="0"><?php echo $GLOBALS['basic']['choseAction'];?></option>
        <option value="delete"><?php echo $GLOBALS['basic']['delete'];?></option>
        <option value="toggleStatus"><?php echo $GLOBALS['basic']['toggleStatus'];?></option>
    </select>
    </div>
    <a class="btn medium primary-bg" href="javascript:void(0);" id="applySelected_btn">
        <span class="glyph-icon icon-separator float-right">
          <i class="glyph-icon icon-cog"></i>
        </span>
        <span class="button-content"> Click </span>
    </a>
</div>

<?php elseif(isset($_GET['mode']) && $_GET['mode'] == "addEdit"): 
if(isset($_GET['id']) && !empty($_GET['id'])):
	$advId 	   	= addslashes($_REQUEST['id']);
	$advInfo   	= Services::find_by_id($advId);
	$status 	= ($advInfo->status==1)?"checked":" ";
	$unstatus 	= ($advInfo->status==0)?"checked":" ";
endif;	
?>
<h3>
<?php echo (isset($_GET['id']))?'Edit Services':'Add Services';?>
<a class="loadingbar-demo btn medium bg-blue-alt float-right" href="javascript:void(0);" onClick="viewServiceslist();">
    <span class="glyph-icon icon-separator">
    	<i class="glyph-icon icon-arrow-circle-left"></i>
    </span>
    <span class="button-content"> Back </span>
</a>
</h3>

<div class="my-msg"></div>
<div class="example-box">
    <div class="example-code">
    	<form action="" class="col-md-12 center-margin" id="services_frm">
        	<div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                        Title :
                    </label>
                </div>                
                <div class="form-input col-md-8">
                    <input placeholder="Service Title (Greek)" class="col-md-6 validate[required,length[0,50]]" type="text" name="title" id="title" value="<?php echo !empty($advInfo->title)?$advInfo->title:"";?>">
                </div>                
            </div> 

            <div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                        Title (Greek):
                    </label>
                </div>                
                <div class="form-input col-md-8">
                    <input placeholder="Service Title" class="col-md-6 validate[required,length[0,50]]" type="text" name="title_greek" id="title_greek" value="<?php echo !empty($advInfo->title_greek)?$advInfo->title_greek:"";?>">
                </div>                
            </div> 

            <div class="form-row">
                <div class="form-label col-md-2">
                    <label for="">
                        Icon :
                    </label>
                </div>                
                <div class="form-input col-md-8">
                    <input placeholder="e.g. fas fa-wifi" class="col-md-6" type="text" name="icon" id="icon" value="<?php echo !empty($advInfo->icon)?$advInfo->icon:"";?>">
                </div>                
            </div> 
            
            <div class="form-row">
            	<div class="form-label col-md-8">
                    <label for="">
                        Content :
                    </label>                      
                    <textarea name="content" id="content" class="large-textarea"><?php echo !empty($advInfo->content)?$advInfo->content:"";?></textarea>
                </div>
            </div>

            <div class="form-row">
                <div class="form-label col-md-8">
                    <label for="">
                        Content (Greek) :
                    </label>                      
                    <textarea name="content_greek" id="content_greek" class="large-textarea"><?php echo !empty($advInfo->content_greek)?$advInfo->content_greek:"";?></textarea>
                </div>
            </div>
    		
            <div class="form-row">     
            	<div class="form-label col-md-2">
                    <label for="">
                        Status :
                    </label>
                </div>           
                <div class="form-checkbox-radio col-md-9">
                    <input type="radio" class="custom-radio" name="status" id="check1" value="1" <?php echo !empty($status)?$status:"checked";?>>
                    <label for="">Published</label>
                    <input type="radio" class="custom-radio" name="status" id="check0" value="0" <?php echo !empty($unstatus)?$unstatus:"";?>>
                    <label for="">Un-Published</label>
                </div>                
            </div>              
            <button btn-action='0' type="submit" name="submit" class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4" id="btn-submit" title="Save">
                <span class="button-content">
                    Save
                </span>
            </button>
            <button btn-action='1' type="submit" name="submit" class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4" id="btn-submit" title="Save">
                <span class="button-content">
                    Save & More
                </span>
            </button>
            <button btn-action='2' type="submit" name="submit" class="btn-submit btn large primary-bg text-transform-upr font-bold font-size-11 radius-all-4" id="btn-submit" title="Save">
                <span class="button-content">
                    Save & quit
                </span>
            </button>
            <input myaction='0' type="hidden" name="idValue" id="idValue" value="<?php echo !empty($advInfo->id)?$advInfo->id:0;?>" />
         </form>    
    </div>
</div>   

<script type="text/javascript" src="<?php echo ASSETS_PATH;?>uploadify/jquery.uploadify.min.js"></script>
<script>
	$(document).ready(function() {
/************************************ Editor for message *****************************************/
	var base_url =  "<?php echo ASSETS_PATH; ?>";
	CKEDITOR.replace( 'content',{
			toolbar :
			[	
				{ name: 'document', items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },					
				{ name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },'/',
				{ name: 'colors', items : [ 'TextColor','BGColor' ] },
				{ name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }
			]
		});
    CKEDITOR.replace( 'content_greek',{
            toolbar :
            [   
                { name: 'document', items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },                   
                { name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },'/',
                { name: 'colors', items : [ 'TextColor','BGColor' ] },
                { name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }
            ]
        });
    });
</script>
<?php endif; ?>