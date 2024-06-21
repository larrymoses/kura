#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56047 "Document Registration List"
{
    ApplicationArea = Basic;
    CardPageID = "Document Registration Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Document registration";
    SourceTableView = where(RegistrationType=const(Document));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Sub Type";"Document Sub Type")
                {
                    ApplicationArea = Basic;
                }
                field("Case ID";"Case ID")
                {
                    ApplicationArea = Basic;
                }
                field("Case Title";"Case Title")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Name";"Accused Name")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document Description";"Document Description")
                {
                    ApplicationArea = Basic;
                }
                field("Document Origin";"Document Origin")
                {
                    ApplicationArea = Basic;
                }
                field("Court Date";"Court Date")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Investigator";"Assigned Investigator")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created";"Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created";"Time Created")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        RegistrationType:=Registrationtype::Document;
    end;
}

