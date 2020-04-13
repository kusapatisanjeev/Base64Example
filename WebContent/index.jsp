

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jquery.min.js"></script>
        <title>Get Image as String</title>
        <script>
            // Check Jquery is working or not
//            $(document).ready(function(){
//                alert('Tested OKAY');
//            });

            function convertToStringAndShow(data) {
                var reader = new FileReader();
                reader.readAsDataURL(data.files[0]);
                reader.onload = function () {
                    // fetch imsge as Base64 String
                    var imageAsString = reader.result;
                    // Show into Image-tag
                    $('#imageTag').attr('src', imageAsString);

                    // Insert into Hidden field, will be get into Server(saveAction.jsp): On form-submit
                    $('#strImage').val(imageAsString);
                }
                //alert( reader.onload);
            }
        </script>
    </head>
    <body>

        <!-- Method must be POST because GET does not support greater than 256 characters -->
        <form action="saveAction.jsp" method="post">
            <h1 align="center">Form Data</h1>
            <table border="1" align="center">
                <tr>
                    <td> Enter Name</td><td><input type="text" name="uname"/></td></tr>
                <tr>
                <td><input type="file" value="Select Image" onchange="convertToStringAndShow(this);" /></td>
                <td> <img src="" id="imageTag" style="border: 1px solid gray;" height="200px;" width="200px" /></td>
            </tr>
            <tr><td colspan="2">
                     <input type="submit" value="SAVE IMAGE" />
                </td>
                </tr>
            
                 </table>
               <input type="hidden" name="strImage" id="strImage" />
                
              
            
           
        </form>
    </body>
</html>
