#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75084 "Vendor Prequalification Entry"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    //Editable = false;
    //InsertAllowed = false;
    //ModifyAllowed = false;
    PageType = List;
    SourceTable = "Vendor Prequalification Entry";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("IFP No.";"IFP No.")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                 field("Vendor Name";"Vendor Name")
                {
                    Editable =false;
                    ApplicationArea = Basic;
                }
                field(Region;Region)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type";"Procurement Type")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Procurement Category Code";"Procurement Category Code")
                {
                    ApplicationArea = Basic;
                }
                
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Special Vendor Category";"Special Vendor Category")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Constituency;Constituency)
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                
            }
        }
    }

    actions
    {
    }
}

