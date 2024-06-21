#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72555 "Corrective Order Response"
{
    PageType = Card;
    SourceTable = "Corrective Orders Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Order No";"Order No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Corrective Order No";"Corrective Order No")
                {
                    ApplicationArea = Basic;
                }
                field("Source Inspection No";"Source Inspection No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID";"Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date";"Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date";"Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No";"Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Works Start Chainage";"Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage";"Works End Chainage")
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
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Control18;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("No Series";"No Series")
                {
                    ApplicationArea = Basic;
                }
                field("Portal Status";"Portal Status")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control23;"Corrective Order Reponse Lines")
            {
                SubPageLink = "Document No"=field("Order No"),
                              "Document Type"=field("Document Type");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Posted)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    Message('Posted Successfully');
                end;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Document Type":="document type"::"Corrective Order Action";
    end;
}

