﻿using System;
using MerchantTribe.CommerceDTO.v1;

namespace MerchantTribeStore.api.rest
{
    public class CategoriesImagesIconHandler: BaseRestHandler
    {
        public CategoriesImagesIconHandler(MerchantTribe.Commerce.MerchantTribeApplication app)
            : base(app)
        {

        }

        // List or Find Single
        public override string GetAction(string parameters, System.Collections.Specialized.NameValueCollection querystring)
        {            
            ApiResponse<bool> response = new ApiResponse<bool>();
            response.Errors.Add(new ApiError("NOTSUPPORTED", "GET method is not supported for this object."));
            response.Content = false;            
            string data = string.Empty;
            data = MerchantTribe.Web.Json.ObjectToJson(response);            
            return data;
        }

        // Create or Update
        public override string PostAction(string parameters, System.Collections.Specialized.NameValueCollection querystring, string postdata)
        {
            string data = string.Empty;
            string bvin = FirstParameter(parameters);
            string fileName = querystring["filename"];
            ApiResponse<bool> response = new ApiResponse<bool>();

            byte[] postedData = null;
            try
            {
                postedData = MerchantTribe.Web.Json.ObjectFromJson<byte[]>(postdata);
                response.Content = MerchantTribe.Commerce.Storage.DiskStorage.UploadCategoryIcon(MTApp.CurrentStore.Id, bvin, fileName, postedData);
            }
            catch(Exception ex)
            {
                response.Errors.Add(new ApiError("EXCEPTION", ex.Message));
                return MerchantTribe.Web.Json.ObjectToJson(response);                
            }
                        
            data = MerchantTribe.Web.Json.ObjectToJson(response);            
            return data;
        }

        public override string DeleteAction(string parameters, System.Collections.Specialized.NameValueCollection querystring, string postdata)
        {
            ApiResponse<bool> response = new ApiResponse<bool>();
            response.Errors.Add(new ApiError("NOTSUPPORTED", "Delete method is not supported for this object."));
            response.Content = false;            
            string data = string.Empty;
            data = MerchantTribe.Web.Json.ObjectToJson(response);            
            return data;
        }
    }
}