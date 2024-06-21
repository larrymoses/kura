#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 52037 "Completed Road  Project Card"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Roads Projects";
    SourceTableView = where(Status = const(Completed));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Project  No"; "Project  No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date"; "Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date"; "Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class"; "Road Class")
                {
                    ApplicationArea = Basic;
                }
                field("Road Length(km)"; "Road Length(km)")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer"; "Project Engineer")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
            // part(Control6;"Road Project Funding Lines")
            // {
            //     SubPageLink = "Project No."=field("Project  No");
            // }
        }
    }

    actions
    {
    }
}

