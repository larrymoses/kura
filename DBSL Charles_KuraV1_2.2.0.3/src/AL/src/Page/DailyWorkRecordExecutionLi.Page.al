#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72438 "Daily Work Record Execution Li"
{
    PageType = ListPart;
    SourceTable = "Daily Work Record Execution";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Record No.";"Record No.")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                }
                field("Job Task No.";"Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Category Code";"Bill Item Category Code")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Quantity";"Contract Quantity")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Quantity Done";"Quantity Done")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Works Start Chainage";"Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage";"Works End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Road Side";"Road Side")
                {
                    ApplicationArea = Basic;
                }
                field("Start Time";"Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("End Time";"End Time")
                {
                    ApplicationArea = Basic;
                }
                field(Repeated;Repeated)
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments/Notes";"Additional Comments/Notes")
                {
                    ApplicationArea = Basic;
                }
                field("Photo No.";"Photo No.")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID";"Dimension Set ID")
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

