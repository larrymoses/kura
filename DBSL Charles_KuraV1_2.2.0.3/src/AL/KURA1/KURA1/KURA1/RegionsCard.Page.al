#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72001 "Regions Card"
{
    Caption = 'Regions Card';
    PageType = Card;
    SourceTable = "Responsibility Center";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Code)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center code.';
                }
                field(Name; Name)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the name.';
                }
                field(Address; Address)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the address associated with the responsibility center.';
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the postal code.';
                }
                field(City; City)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the city where the responsibility center is located.';
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field(Contact; Contact)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the name of the person you regularly contact. ';
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the location of the responsibility center.';
                }
                field(ShowMap; ShowMapLbl)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    ShowCaption = false;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the customer''s address on your preferred map website.';
                    Visible = false;

                    trigger OnDrillDown()
                    begin
                        //CurrPage.UPDATE(TRUE);
                        //DisplayMap;
                    end;
                }
                field(Vision; Vision)
                {
                    ApplicationArea = Basic;
                }
                field(Mission; Mission)
                {
                    ApplicationArea = Basic;
                }
                field(Motto; Motto)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center''s phone number.';
                }
                field("Fax No."; "Fax No.")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the fax number of the responsibility center.';
                }
                field("E-Mail"; "E-Mail")
                {
                    ApplicationArea = Location;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the email address of the responsibility center.';
                }
                field("Home Page"; "Home Page")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the responsibility center''s web site.';
                }
            }
            group("Road Statistics")
            {
                Editable = false;
                field("No. Of Constituencies"; "No. Of Constituencies")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Road Sections"; "No. of Road Sections")
                {
                    ApplicationArea = Basic;
                }
                field("Total Road Network Length (Km)"; "Total Road Network Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Paved Road Length (Km)"; "Paved Road Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Paved Road Length %"; "Paved Road Length %")
                {
                    ApplicationArea = Basic;
                }
                field("Unpaved Road Length %"; "Unpaved Road Length %")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Planned Road Projects"; "No. of Planned Road Projects")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Ongoing Road Projects"; "No. of Ongoing Road Projects")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Completed Road Projects"; "No. of Completed Road Projects")
                {
                    ApplicationArea = Basic;
                }
                field("Total Budget (Construction)"; "Total Budget (Construction)")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Cost (Construction)"; "Actual Cost (Construction)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Budget (Maintainenace)"; "Total Budget (Maintainenace)")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Cost (Maintainenace)"; "Actual Cost (Maintainenace)")
                {
                    ApplicationArea = Basic;
                }
            }
            group(" Research")
            {
                Visible = false;
                field("Research Center?"; "Research Center?")
                {
                    ApplicationArea = Basic;
                }
                group("Overview Details")
                {
                    field(Overview; WorkDescription)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Overview';
                        MultiLine = true;

                        trigger OnValidate()
                        begin
                            //SetWorkDescription(WorkDescription);
                        end;
                    }
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control35; "Research Center Factbox")
            {
                SubPageLink = Code = field(Code);
                Visible = false;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Resp. Ctr.")
            {
                Caption = '&Resp. Ctr.';
                Image = Dimensions;
                action(Dimensions)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5714),
                                  "No." = field(Code);
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
                action("Copy Company Address")
                {
                    ApplicationArea = Basic;
                    Image = Copy;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Code = '' then
                            Error(Text0001, Code);
                        CompInfo.Get();
                        Address := CompInfo.Address;
                        "Address 2" := CompInfo."Address 2";
                        "Post Code" := CompInfo."Post Code";
                        Vision := CompInfo.Vision;
                        Mission := CompInfo.Mission;
                        Motto := CompInfo.Motto;
                        City := CompInfo.City;
                        "Country/Region Code" := CompInfo."Country/Region Code";
                        Modify;
                        Message(Text0002);
                    end;
                }
                action("Staff Profile")
                {
                    ApplicationArea = Basic;
                    Image = Employee;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Employee List-P";
                    RunPageLink = "Research Center" = field(Code);
                }
                action("Grants Profile")
                {
                    ApplicationArea = Basic;
                    Image = Grid;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Grant Funding Application List";
                    RunPageLink = "Research Center" = field(Code);
                }
                action("Road Work Projects")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    // RunObject = Page "Job List";
                    // RunPageLink = "Research Center"=field(Code);
                }
                action("Sub Centers")
                {
                    ApplicationArea = Basic;
                    Image = Skills;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Research Sub-Center List";
                    RunPageLink = "Research Centre" = field(Code);
                    Visible = false;
                }
                action("Research Programs")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Research Center Programs List";
                    RunPageLink = "Center Code" = field(Code);
                    Visible = false;
                }
                action("Research Infrastructure")
                {
                    ApplicationArea = Basic;
                    Image = FixedAssets;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Research Infrastructure List";
                    RunPageLink = "Center Code" = field(Code);
                    Visible = false;
                }
                action("Fixed Assets")
                {
                    ApplicationArea = Basic;
                    Image = FixedAssets;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Fixed Asset List";
                    RunPageLink = "Research Center" = field(Code);
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Research Center Statistics";
                    RunPageLink = Code = field(Code);
                }
            }
            group(ActionGroup69)
            {
                action("Road Sections")
                {
                    ApplicationArea = Basic;
                    Image = ServiceItem;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Road Sections";
                    RunPageLink = "Primary Region ID" = field(Code);
                }
                action("Maintenance Budget Book Entries")
                {
                    ApplicationArea = Basic;
                    Image = Opportunity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Maintenance Budget  Ceilings";
                    RunPageLink = "Region ID" = field(Code);
                }
                action("Construction Budget Book Entries")
                {
                    ApplicationArea = Basic;
                    Image = EntryStatistics;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Construction Budget  Ceilings";
                    RunPageLink = "Region ID" = field(Code);
                }
                action("Road Work Plan Entries")
                {
                    ApplicationArea = Basic;
                    Image = WIPLedger;
                    Promoted = true;
                    PromotedCategory = Category4;
                    //  RunObject = Page "Road WorkPlan Package Line";
                    //   RunPageLink = "Region ID"=field(Code);
                }
                action("Construction Projects")
                {
                    ApplicationArea = Basic;
                    Image = JobJournal;
                    Promoted = true;
                    PromotedCategory = Category4;
                    // RunObject = Page "Job List";
                    // RunPageLink = "Region ID"=field(Code),
                    //               "Road Project Category"=const('2');
                }
                action("Maintainenace Projects")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Category4;
                    // RunObject = Page "Job List";
                    // RunPageLink = "Region ID"=field(Code),
                    //               "Road Project Category"=const('3');
                }
                action("Studies & Surveys")
                {
                    ApplicationArea = Basic;
                    Image = JobTimeSheet;
                    Promoted = true;
                    PromotedCategory = Category4;
                    //     RunObject = Page "Job List";
                    //     RunPageLink = "Region ID"=field(Code),
                    //                   "Road Project Category"=const('1');
                }
            }
        }
        area(reporting)
        {
            group(ActionGroup38)
            {
                Visible = false;
                action("Research Centers")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                 //   RunObject = Report "Research Center List";
                    Visible = false;
                }
                action("Research Centers Profile")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    Visible = false;

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65010, true, true, ResearchCenter);
                        end;
                    end;
                }
                separator(Action43)
                {
                }
                action("Region Grant Profile")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65011, true, true, ResearchCenter);
                        end;
                    end;
                }
                action("Region Projects Profile")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65012, true, true, ResearchCenter);
                        end;
                    end;
                }
                separator(Action44)
                {
                }
                action("Fixed Assets List")
                {
                    ApplicationArea = Basic;
                    Image = "report";
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        ResearchCenter.Reset;
                        ResearchCenter.SetRange(Code, Code);
                        if ResearchCenter.Find('-') then begin
                            Report.Run(65013, true, true, ResearchCenter);
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // /
    end;

    var
        CompInfo: Record "Company Information";
        Text0001: label 'Research Code %1 should not be blank';
        Text0002: label 'Details updated successfully';
        WorkDescription: Text;
        ShowMapLbl: label 'Show on Map';
        ResearchCenter: Record "Research Center";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        /*OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);*/

    end;
}

