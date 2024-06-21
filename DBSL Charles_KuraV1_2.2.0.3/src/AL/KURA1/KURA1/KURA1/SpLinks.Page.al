#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 78006 "SpLinks"
{
    PageType = List;
    SourceTable = "Record Link";
    // SourceTableView = where("Fetch To Sharepoint"=filter(Yes),
    //                         Polled=filter(No));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Link ID"; "Link ID")
                {
                    ApplicationArea = Basic;
                    //             }
                    //             field(Description;Description)
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //             field("Base URL";"Base URL")
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //             field("Fetch To Sharepoint";"Fetch To Sharepoint")
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //             field("Document No";"Document No")
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //             field("SP URL Returned";"SP URL Returned")
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //             field(Polled;Polled)
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //             field("Failure reason";"Failure reason")
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //             field(LocalUrl;LocalUrl)
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //         }
                    //     }
                    // }

                    // actions
                    // {
                    // }
                }

            }
        }
    }
}