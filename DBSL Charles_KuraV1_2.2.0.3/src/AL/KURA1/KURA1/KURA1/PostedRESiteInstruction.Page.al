#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72699 "Posted RE Site Instruction"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Site Instructions Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contract No";"Contract No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No.";"Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage";"Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage";"End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Chainage Description";"Chainage Description")
                {
                    ApplicationArea = Basic;
                }
                field("Works Instructions(Descriptio)";"Works Instructions(Descriptio)")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region Name";"Region Name")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID";"Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Name";"Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID";"Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name";"Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime";"Created DateTime")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Site Agent No.";"Site Agent No.")
                {
                    ApplicationArea = Basic;
                }
                field("Site Agent Name";"Site Agent Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Portal Status";"Portal Status")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount Exclusive VAT";"Total Amount Exclusive VAT")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount Inclusive VAT";"Total Amount Inclusive VAT")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control29;"Poste Site Instruction SubPage")
            {
                SubPageLink = "Document No."=field("Document No.");
            }
        }
    }

    actions
    {
    }
}

