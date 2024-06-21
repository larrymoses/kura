#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59135 "Vehicle Insurance Lines"
{
    PageType = ListPart;
    SourceTable = "Vehicle Insurance Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Insurance Number';
                }
                field("Policy Number";"Policy Number")
                {
                    ApplicationArea = Basic;
                }
                field("FA No.";"FA No.")
                {
                    ApplicationArea = Basic;
                }
                field("Registration No.";"Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Description";"Vehicle Description")
                {
                    ApplicationArea = Basic;
                }
                field(Make;Make)
                {
                    ApplicationArea = Basic;
                }
                field(Model;Model)
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Type";"Insurance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Location";"Vehicle Location")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiration Date";"Expiration Date")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Vendor No.";"Insurance Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Vendor Name";"Insurance Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Insuance Details";"Insuance Details")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

