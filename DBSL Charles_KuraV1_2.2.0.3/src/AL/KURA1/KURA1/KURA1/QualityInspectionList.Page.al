#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72550 "Quality Inspection List"
{
    CardPageID = "Quality Inspection Card";
    PageType = List;
    SourceTable = "Inspection Headersss";
    SourceTableView = where("Inspection Type"=filter(" "));
    ApplicationArea = Basic;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection No";"Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Type";"Inspection Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contract ID";"Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Request No";"Contractor Request No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Date";"Inspection Date")
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
                field("Committee No";"Committee No")
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
                field("DLP Start Date";"DLP Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("DLP Period";"DLP Period")
                {
                    ApplicationArea = Basic;
                }
                field("DLP End Date";"DLP End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Tender Sum Inc Tax";"Awarded Tender Sum Inc Tax")
                {
                    ApplicationArea = Basic;
                }
                field("Payments To Date";"Payments To Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Committee Decision";"Committee Decision")
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
                field("Works Start Chainage";"Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage";"Works End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contractor Rep.";"Primary Contractor Rep.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Representative Role";"Contractor Representative Role")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Rep. Email";"Contractor Rep. Email")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan 1D";"Work Execution Plan 1D")
                {
                    ApplicationArea = Basic;
                }
                field("Commencement Order No";"Commencement Order No")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Project Name";"Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager/Engineer";"Project Manager/Engineer")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID";"Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID";"Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID";"Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Agency No.";"Funding Agency No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetRange("Created By",UserId);
    end;

    trigger OnAfterGetRecord()
    begin
        SetRange("Created By",UserId);
    end;

    trigger OnOpenPage()
    begin
        SetRange("Created By",UserId);
    end;
}

