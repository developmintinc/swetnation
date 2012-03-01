
namespace MerchantTribeStore.Areas.ContentBlocks.Models
{
    public class SideMenuItem
    {
        public string Url { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }
        public bool OpenInNewWindow { get; set; }
        public string CssClass { get; set; }

        public SideMenuItem()
        {
            Url = string.Empty;
            Name = string.Empty;
            Title = string.Empty;
            OpenInNewWindow = false;
            CssClass = string.Empty;
        }
    }
}