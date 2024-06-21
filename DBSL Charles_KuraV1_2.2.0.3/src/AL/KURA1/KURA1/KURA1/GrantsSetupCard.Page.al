#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65020 "Grants Setup Card"
{
    ApplicationArea = Basic;
    Caption = 'Grants Management Setup';
    PageType = Card;
    SourceTable = "Grants Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Primary Role";"Primary Role")
                {
                    ApplicationArea = Basic;
                }
                field("Email Notification Path";"Email Notification Path")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Number Series")
            {
                field("Research Iinfrastructure Nos";"Research Iinfrastructure Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Research Output Nos";"Research Output Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Researcher Nos";"Researcher Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Grantor Nos";"Grantor Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Opportunity Nos";"Funding Opportunity Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Proposal Nos";"Grant Proposal Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Admin Nos";"Grant Admin Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Project Admin Nos";"Project Admin Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Research Project Nos";"Research Project Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Project Contract Nos";"Project Contract Nos")
                {
                    ApplicationArea = Basic;
                }
                field("IFT Nos";"IFT Nos")
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

