using System.Collections.Generic;
using MerchantTribeStore.Models;

namespace MerchantTribeStore.Areas.ContentBlocks.Models
{
    public class FeaturedProductsViewModel
    {
        public string Title { get; set; }
        public PagerViewModel PagerData { get; set; }
        public List<SingleProductViewModel> Items { get; set; }

        public FeaturedProductsViewModel()
        {
            Title = string.Empty;
            PagerData = new PagerViewModel();
            Items = new List<SingleProductViewModel>();
        }
    }
}