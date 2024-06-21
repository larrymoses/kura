report 50023 "RICS Report"
{
    ApplicationArea = All;
    Caption = 'RICS Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/RICS.rdl';
    dataset
    {
        dataitem(RoadInvConditionSurvey; "Road Inv. Condition Survey")
        {
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(Motto; CompanyInfo.Motto)
            {

            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }

            column(DocumentDate; "Document Date")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(SurveyType; "Survey Type")
            {
            }
            column(FinancialYear; "Financial Year")
            {
            }
            column(Description; Description)
            {
            }
            column(ServiceType; "Service Type")
            {
            }
            column(TargetRoadInventoryType; "Target Road Inventory Type")
            {
            }
            column(Region; Region)
            {
            }
            column(Region_Name;"Region Name")
            {
            }
            column(BranchCenter; "Branch/Center")
            {
            }
            column(Directorate; Directorate)
            {
            }
            column(ApprovalStatus; "Approval Status")
            {
            }
            column(Posted; Posted)
            {
            }
            dataitem("RICS Lines"; "RICS Lines")
            {
                DataItemLink = "Document No." = field("Document No."), "Shortcut Dimension 1 Code" = field(Region);
                column(LinesShortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
                {

                }
                column(LinesShortcut_Dimension_2_Code; "Shortcut Dimension 2 Code")
                {

                }
                column(LinesShortcut_Dimension_3_Code; "Shortcut Dimension 3 Code")
                {

                }
                column(LinesShortcut_Dimension_4_Code; "Shortcut Dimension 4 Code")
                {

                }
                column(LinesShortcut_Dimension_5_Code; "Shortcut Dimension 5 Code")
                {

                }
                column(LinesRoad_Code; "Road Code")
                {

                }
                column(LinesRoad_Category; "Road Category")
                {

                }
                column(LinesLink_Name; "Link Name")
                {

                }
                column(LinesStart_Chainage_Km_; "Start Chainage(Km)")
                {

                }
                column(LinesEnd_Chainage_Km_; "End Chainage(Km)")
                {

                }
                column(LinesExisting_Culverts_Lines_; "Existing Culverts(Lines)")
                {

                }
                column(LinesProposed_Culverts_Lines_; "Proposed Culverts(Lines)")
                {

                }
                column(LinesCut_to_spoil_mtr__M__; "Cut to spoil mtr (M³)")
                {

                }
                column(LinesDrain_Cleaning__M_; "Drain Cleaning (M)")
                {

                }
                column(LinesBush_Clearing__M__; "Bush Clearing (M²)")
                {

                }
                column(LinesSide_Slabs__M__; "Side Slabs (M²)")
                {

                }
                column(LinesKerbs_Installation; "Kerbs Installation")
                {

                }
                column(LinesPatching_Required_M_; "Patching Required M³")
                {

                }
                column(LinesOverlay_Required_M_; "Overlay Required M³")
                {

                }
                column(LinesGravel_Required_M_; "Gravel Required M³")
                {

                }
                dataitem("RICS Detailed Line"; "RICS Detailed Line")
                {
                    DataItemLink = "Document No." = field("Document No."), "Road Code" = field("Road Code");
                     column(Road_Code;"Road Code")
                    {
                        
                    }
                    column(Start_Chainage_Km_;"Start Chainage(Km)")
                    {

                    }
                     column(End_Chainage_Km_;"End Chainage(Km)")
                    {
                        
                    }
                     column(Surface_Type;"Surface Type")
                    {
                        
                    }
                     column(Width__M_;"Width (M)")
                    {
                        
                    }
                     column(Terrain;Terrain)
                    {
                        
                    }
                     column(Road_Condition;"Road Condition")
                    {
                        
                    }
                     column(Road_Condition__;"Road Condition %")
                    {
                        
                    }
                     column(Proposed_Intervention;"Proposed Intervention")
                    {
                        
                    }
                    column(Existing_Culverts_Lines_; "Existing Culverts(Lines)")
                    {

                    }
                    column(Proposed_Culverts_Lines_; "Proposed Culverts(Lines)")
                    {

                    }
                    column(Cut_to_spoil_mtr__M__; "Cut to spoil mtr (M³)")
                    {

                    }
                    column(Drain_Cleaning__M_; "Drain Cleaning (M)")
                    {

                    }
                    column(Bush_Clearing__M__; "Bush Clearing (M²)")
                    {

                    }
                    column(Side_Slabs__M__; "Side Slabs (M²)")
                    {

                    }
                    column(Kerbs_Installation; "Kerbs Installation")
                    {

                    }
                    column(Patching_Required_M_; "Patching Required M³")
                    {

                    }
                    column(Overlay_Required_M_; "Overlay Required M³")
                    {

                    }
                    column(Gravel_Required_M_; "Gravel Required M³")
                    {

                    }
                }
            }
            trigger OnAfterGetRecord()
            begin
                if CompanyInfo.get() then begin
                        CompanyInfo.CalcFields(Picture);
                    FormatAddr.GetCompanyAddr(Region, RespCenter, CompanyInfo, CompanyAddr);
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        ResponsibilityCenter: Record "Responsibility Center";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
}
