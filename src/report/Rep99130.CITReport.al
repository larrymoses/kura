report 99130 "CIT Report"
{
    ApplicationArea = All;
    Caption = 'CIT Report';
    RDLCLayout = './Layouts/CITReport.rdl';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(PurchaseHeader; "Purchase Header")
        {
            DataItemTableView = where("Document Type" = const("Blanket Order"));
            PrintOnlyIfDetail = true;
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
            column(Contract_No_; "No.")
            {

            }
            column(Contract_Start_Date; "Contract Start Date")
            {

            }
            column(Contract_End_Date; "Contract End Date")
            {

            }
            column(Contract_Description; "Contract Description")
            {

            }
            column(Contract_Status; "Contract Status")
            {

            }
            column(Contract_Type; "Contract Type")
            {

            }
            column(Contract_Sum; "Contract Sum")
            {

            }
            column(Contractor_No_; "Buy-from Vendor No.")
            {

            }
            column(Contractor_Name; "Buy-from Vendor Name")
            {

            }
            column(ContractorPIN; "VAT Registration No.")
            {

            }
            column(Contractor_Address; "Buy-from Address")
            {

            }
            column(Contractor_Address_2; "Buy-from Address 2")
            {

            }
            column(Contractor_Post_Code; "Buy-from Post Code")
            {

            }
            column(Contractor_City; "Buy-from City")
            {

            }
            column(Contractor_Country_Region_Code; "Buy-from Country/Region Code")
            {

            }
            column(Contract_IFS_Code; "IFS Code")
            {

            }
            column(Termination_Date; "Termination Date")
            {

            }
            dataitem(Project; Job)
            {
                DataItemLink = "No." = field("Project No");
                DataItemLinkReference = PurchaseHeader;
                column(Project_No_; "No.")
                {

                }
                column(ProjectDescription; Description)
                {

                }

            }
            dataitem("Contract Required Documents"; "Contract Required Documents")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = PurchaseHeader;

                column(Document_Type; "Document Type")
                {

                }
                column(Document_Description; "Document Description")
                {

                }
                column(Requirement_Type; "Requirement Type")
                {

                }
                column(Attached; format(Attached))
                {

                }
                column(Attached_Date; "Attached Date")
                {

                }


                trigger OnAfterGetRecord()
                var
                    DocAttached: Record "Document Attachment";
                begin
                    DocAttached.Reset();
                    DocAttached.SetRange("No.", "Document No.");
                    DocAttached.SetRange("Contract Document Type", "Document Type");
                    if DocAttached.FindFirst() then begin
                        Attached := true;
                        "Attached Date" := DocAttached."Attached Date";
                    end else
                        Attached := false;
                end;
            }
            dataitem("Inspection Headersss"; "Inspection Headersss")
            {
                DataItemLink = "Contract ID" = field("No.");
                DataItemLinkReference = PurchaseHeader;
                DataItemTableView = where("Inspection Type" = const("Taking Over Inspection"));
                column(Inspection_Date; "Inspection Date")
                {

                }
                column(Inspection_No; "Inspection No")
                {

                }
                column(Agreed_Take_Over_Date; "Agreed Take Over Date")
                {

                }
            }
            dataitem("Quality Inspection"; "Inspection Headersss")
            {
                DataItemLink = "Contract ID" = field("No.");
                DataItemLinkReference = PurchaseHeader;
                DataItemTableView = where("Inspection Type" = const("Taking Over Inspection"));
                column(Quality_Inspection_Date; "Inspection Date")
                {

                }
                column(Quality_Inspection_No; "Inspection No")
                {

                }
                column(Quality_Inspection__Decision; "Committee Decision")
                {

                }

            }
            dataitem(DLP; "Inspection Headersss")
            {
                DataItemLink = "Contract ID" = field("No.");
                DataItemLinkReference = PurchaseHeader;
                DataItemTableView = where("Inspection Type" = const("Taking Over Inspection"));
                column(DLPInspectionDate; "Inspection Date")
                {

                }
                column(DLPInspection_No; "Inspection No")
                {

                }
                column(DLPInspection__Decision; "Committee Decision")
                {

                }
                column(DLP_End_Date; "DLP End Date")
                {

                }

            }
            dataitem("Measurement &  Payment Header"; "Measurement &  Payment Header")
            {
                DataItemLink = "Contract ID" = field("No.");
                DataItemLinkReference = PurchaseHeader;
                DataItemTableView = where("Document Type" = const("Contractor Payment Request"), "Payment Certificate Type" = const("Interim Payment"));
                column(IPC_No_; "Document No.")
                {

                }
                column(IPC_Date; "Document Date")
                {

                }
                column(IPCAmount; "Total Cost Including VAT")
                {

                }
                trigger OnAfterGetRecord()
                begin
                    Calcfields("Total Cost Including VAT");
                end;
            }
            dataitem("Project Variation Header"; "Project Variation Header")
            {
                DataItemLink = "Purchase Contract ID" = field("No.");
                DataItemLinkReference = PurchaseHeader;
                DataItemTableView = where("Document Type" = const("Contractor Variation Request"));
                column(ContractVariation_Date; "Document Date")
                {

                }
                column(Original_Value_of_Work__LCY_; "Original Value of Work (LCY)")
                {

                }
                column(Variation_of_Price_Amount; "Variation of Price Amount")
                {

                }
                column(Variation_Percentage___; "Variation Percentage(%)")
                {

                }
                trigger OnAfterGetRecord()
                begin
                    CalcFields("Original Value of Work (LCY)");
                end;
            }
            dataitem("Contract Termination Reasons"; "Contract Termination Reasons")
            {
                DataItemLink = "Contract No." = field("No.");
                DataItemLinkReference = PurchaseHeader;
                column(Reason; Reason)
                {

                }
            }
            dataitem("PerforanceGuarantee";"Insurance/Guarantee Header")
            {
                DataItemLink = "Contractor ID" =field("No.");
                DataItemTableView = where("Document Type"=const("Performance Guarantee"));
                column(PerformanceGuarantee_Date;"Document Date")
                {

                }
                 column(PerformanceGuarantee_No_;"Document No.")
                {
                    
                }
                 column(Insurer_Guarantor_Name;"Insurer/Guarantor Name")
                {
                    
                }
                 column(Amount_Insured_Guaranteed;"Amount Insured/Guaranteed")
                {
                    
                }
                 column(Guarantee_Form_of_Security;"Form of Security")
                {
                    
                }
                column(Guarantee_Expiry_Date;"Expiry Date")
                {

                }
            }

            trigger OnAfterGetRecord()
            var

            begin

            end;

            trigger OnPreDataItem()
            begin
                SetRange("Document Type", "Document Type"::"Blanket Order");
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnPreReport()
    begin
        if CompanyInfo.get() then
            CompanyInfo.CalcFields(Picture);
        if UserSetup.Get(UserId) then
            FormatAddr.GetCompanyAddr(UserSetup."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
    end;

    var
        CustomFunction: Codeunit "Custom Function";
        ResponsibilityCenter: Record "Responsibility Center";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
        UserSetup: Record "User Setup";
        Country: Text[50];
        CountryRegion: Record "Country/Region";
        Attached: Boolean;
        "Attached Date": DateTime;
}
