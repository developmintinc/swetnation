<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (FileUploadControl.HasFile)
        {
            try
            {
                if (FileUploadControl.PostedFile.ContentType == "image/jpeg" || FileUploadControl.PostedFile.ContentType == "image/png" || FileUploadControl.PostedFile.ContentType == "image/gif")
                {
                    if (FileUploadControl.PostedFile.ContentLength < 102400)
                    {
                        string filename = Path.GetFileName(FileUploadControl.FileName);
                        filename = Server.MapPath("~/Images/sites/1/products/c700d9d0-12a2-4f6d-841a-c355f7887a8e/medium/") + filename;
                        FileUploadControl.SaveAs(filename);
                        if (File.Exists(filename))
                        {
                            StatusLabel.Text = "Upload status: File uploaded!";
                        }
                        else
                        {
                            StatusLabel.Text = "Upload status: File not uploaded!";
                        }
                    }
                    else
                        StatusLabel.Text = "Upload status: The file has to be less than 100 kb!";
                }
                else
                    StatusLabel.Text = "Upload status: Only JPEG files are accepted!";
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Title</title>
    </head>
    <body>
        <form id="HtmlForm" runat="server">
            <div>
                <asp:FileUpload id="FileUploadControl" runat="server" />
                    <asp:Button runat="server" id="UploadButton" text="Upload" onclick="UploadButton_Click" />
                <br /><br />
                <asp:Label runat="server" id="StatusLabel" text="Upload status: " />
            </div>
        </form>
    </body>
</html>
