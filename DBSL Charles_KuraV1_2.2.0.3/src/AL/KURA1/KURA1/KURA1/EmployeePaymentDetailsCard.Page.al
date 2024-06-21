#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57202 "Employee Payment Details Card"
{
    PageType = Card;
    SourceTable = "Employee Payment Information";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Bank Code";"Employee Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Bank Name";"Employee Bank Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Bank Account Number";"Employee Bank Account Number")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Bank Branch Code";"Employee Bank Branch Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Bank Branch Name";"Employee Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Mobile No";"Employee Mobile No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No Series";"No Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

