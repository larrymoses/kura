#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72551 "Quality Inspection Card"
{
    PageType = Card;
    SourceTable = "Inspection Headersss";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Inspection No"; "Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Type"; "Inspection Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contract ID"; "Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Request No"; "Contractor Request No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Date"; "Inspection Date")
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
                field("Work Execution Plan 1D"; "Work Execution Plan 1D")
                {
                    ApplicationArea = Basic;
                }
                field("Commencement Order No"; "Commencement Order No")
                {
                    ApplicationArea = Basic;
                }
                field("Works Inspection Template No."; "Works Inspection Template No.")
                {
                    ApplicationArea = Basic;
                    Visible = WorksVisible;
                }
                field("Survey Works Template No."; "Survey Works Template No.")
                {
                    ApplicationArea = Basic;
                    Visible = SurveyWorksVisible;
                }
                field("Lab Works Template No."; "Lab Works Template No.")
                {
                    ApplicationArea = Basic;
                    Visible = LabWorksVisible;
                }
                field("Project Start Date"; "Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date"; "Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("DLP Start Date"; "DLP Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("DLP Period"; "DLP Period")
                {
                    ApplicationArea = Basic;
                }
                field("DLP End Date"; "DLP End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Payments To Date"; "Payments To Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
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
            }
            part(Control41; "Project Inspection Line Subpag")
            {
                Caption = 'Works Inspections';
                SubPageLink = "Inspection No" = field("Inspection No"),
                              "Inspection Type" = field("Inspection Type"),
                              Type = filter("Works Inspection");
                Visible = WorksVisible;
            }
            part(Control39; "Inspection Survey Works")
            {
                Caption = 'Survey Works';
                SubPageLink = "Inspection No" = field("Inspection No"),
                              "Inspection Type" = field("Inspection Type"),
                              Type = filter("Survey Works");
                Visible = SurveyWorksVisible;
            }
            part(Control40; "Inspection Lab Works")
            {
                Caption = 'Lab Works';
                SubPageLink = "Inspection No" = field("Inspection No"),
                              "Inspection Type" = field("Inspection Type"),
                              Type = filter("Lab Works");
                Visible = LabWorksVisible;
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                field("Awarded Tender Sum Inc Tax"; "Awarded Tender Sum Inc Tax")
                {
                    ApplicationArea = Basic;
                }
                field("Works Start Chainage"; "Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage"; "Works End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contractor Rep."; "Primary Contractor Rep.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Representative Role"; "Contractor Representative Role")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Rep. Email"; "Contractor Rep. Email")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager/Engineer"; "Project Manager/Engineer")
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
                field("Constituency ID"; "Constituency ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Corrective Orders")
            {
                ApplicationArea = Basic;
                Image = CancelledEntries;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Inspection Corrective Orders";
                RunPageLink = "Inpection Type" = field("Inspection Type"),
                              "Inspection No" = field("Inspection No");
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // RMSManagement.FnPostQualityInspection(InspectionPlanLine,Rec,InspectionLine);
                    Message('Quality Inspection %1 Posted Successfully', "Inspection No");
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        WorksVisible := false;
        LabWorksVisible := false;
        SurveyWorksVisible := false;
        if UserSetup.Get(UserId) then begin
            if UserSetup."View Works Inspections" = true then begin
                WorksVisible := true;
                LabWorksVisible := false;
                SurveyWorksVisible := false;
            end;
            if UserSetup."View Survey Works Inspections" = true then begin
                WorksVisible := false;
                LabWorksVisible := false;
                SurveyWorksVisible := true;
            end;
            if UserSetup."View Lab Works Inspections" = true then begin
                WorksVisible := false;
                LabWorksVisible := true;
                SurveyWorksVisible := false;
            end;
            if UserSetup."View Works Inspections" = true and UserSetup."View Lab Works Inspections" = true and UserSetup."View Survey Works Inspections" = true then begin
                WorksVisible := true;
                LabWorksVisible := true;
                SurveyWorksVisible := true;
            end;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        WorksVisible := false;
        LabWorksVisible := false;
        SurveyWorksVisible := false;
        if UserSetup.Get(UserId) then begin
            if UserSetup."View Works Inspections" = true then begin
                WorksVisible := true;
                LabWorksVisible := false;
                SurveyWorksVisible := false;
            end;
            if UserSetup."View Survey Works Inspections" = true then begin
                WorksVisible := false;
                LabWorksVisible := false;
                SurveyWorksVisible := true;
            end;
            if UserSetup."View Lab Works Inspections" = true then begin
                WorksVisible := false;
                LabWorksVisible := true;
                SurveyWorksVisible := false;
            end;
            if UserSetup."View Works Inspections" = true and UserSetup."View Lab Works Inspections" = true and UserSetup."View Survey Works Inspections" = true then begin
                WorksVisible := true;
                LabWorksVisible := true;
                SurveyWorksVisible := true;
            end;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Inspection Type" := "inspection type"::" ";
    end;

    trigger OnOpenPage()
    begin
        WorksVisible := false;
        LabWorksVisible := false;
        SurveyWorksVisible := false;
        if UserSetup.Get(UserId) then begin
            if UserSetup."View Works Inspections" = true then begin
                WorksVisible := true;
                LabWorksVisible := false;
                SurveyWorksVisible := false;
            end;
            if UserSetup."View Survey Works Inspections" = true then begin
                WorksVisible := false;
                LabWorksVisible := false;
                SurveyWorksVisible := true;
            end;
            if UserSetup."View Lab Works Inspections" = true then begin
                WorksVisible := false;
                LabWorksVisible := true;
                SurveyWorksVisible := false;
            end;
            if UserSetup."View Works Inspections" = true and UserSetup."View Lab Works Inspections" = true and UserSetup."View Survey Works Inspections" = true then begin
                WorksVisible := true;
                LabWorksVisible := true;
                SurveyWorksVisible := true;
            end;
        end;
    end;

    var
        RMSManagement: Codeunit "RMS Management";
        InspectionPlanLine: Record "Inspection Plan Line";
        InspectionHeadersss: Record "Inspection Headersss";
        InspectionLine: Record "Inspection Line";
        LabWorksVisible: Boolean;
        SurveyWorksVisible: Boolean;
        WorksVisible: Boolean;
        UserSetup: Record "User Setup";
}

