#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72539 "Contractor Personnel App List"
{
    ApplicationArea = ALL;
    CardPageID = "Contractor Personnel Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "WEP Contractor Submission";
    SourceTableView = where("Document Type" = filter("Contractor Personnel Appointment"));
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; "Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Contract ID"; "Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project No"; "Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No"; "Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; "Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan"; "Work Execution Plan")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; "Created DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Site Agent Staff No"; "Site Agent Staff No")
                {
                    ApplicationArea = Basic;
                }
                field("Site Agent Name"; "Site Agent Name")
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No"; "Telephone No")
                {
                    ApplicationArea = Basic;
                }
                field("E-mail"; "E-mail")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(City; City)
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

