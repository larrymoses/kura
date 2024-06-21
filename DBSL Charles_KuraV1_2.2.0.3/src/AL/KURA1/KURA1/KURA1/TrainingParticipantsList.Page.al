#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69229 "Training Participants List"
{
    PageType = ListPart;
    SourceTable = "Training Participants";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Code";"Employee Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee No.';
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Destination;Destination)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Days";"No. of Days")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount";"Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Training Responsibility";"Training Responsibility")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Region';
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Training Code";"Training Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Training Responsibility Code";"Training Responsibility Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Requestor;Requestor)
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

