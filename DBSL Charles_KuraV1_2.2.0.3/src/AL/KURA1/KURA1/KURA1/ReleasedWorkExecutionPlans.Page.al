#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72274 "Released Work Execution Plans"
{
    ApplicationArea = Basic;
    CardPageID = "Work Execution Plan";
    Editable = true;
    PageType = List;
    SourceTable = "Project Mobilization Header";
    // SourceTableView = where(Status=filter(Released),
    //                       "Document Type"=filter("Work Execution Programme"));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Commencement Order ID"; "Commencement Order ID")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID"; "Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No."; "Contractor No.")
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
                field("Road Code"; "Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No."; "Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name"; "Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date"; "Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End  Date"; "Project End  Date")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID"; "Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; "Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; "Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; "Department ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created DateTime"; "Created DateTime")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

