﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MerchantTribe.CommerceDTO.v1
{
    public interface IApiResponse
    {        
        List<ApiError> Errors { get; set; }
    }
}
