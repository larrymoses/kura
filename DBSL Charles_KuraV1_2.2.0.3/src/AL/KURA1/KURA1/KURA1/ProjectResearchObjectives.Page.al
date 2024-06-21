#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65100 "Project Research Objectives"
{
    PageType = List;
    SourceTable = "Project Research Objectives";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No";"Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Research Objective";"Research Objective")
                {
                    ApplicationArea = Basic;
                }
                field("Research Program";"Research Program")
                {
                    ApplicationArea = Basic;
                }
                field("Project Area";"Project Area")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Copy From Grant Document")
            {
                ApplicationArea = Basic;
                Image = CopyDocument;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Text0001: Integer;
                begin
                    ContractLines.Reset;
                    ContractLines.SetRange("Project Contract No.","Project No");
                    if ContractLines.Find('-') then begin
                       repeat
                         GrantResearchObjct.Reset;
                         GrantResearchObjct.SetRange("Grant Application ID",ContractLines."Grant ID");
                         if GrantResearchObjct.Find('-') then begin
                           repeat
                             Init;
                              "Project No":=ContractLines."Job No";
                              "Research Objective":=GrantResearchObjct."Research Objective";
                              "Research Program":=GrantResearchObjct."Research Program";
                              "Project Area":=GrantResearchObjct."Project Area";
                            Insert;
                           until GrantResearchObjct.Next=0;
                        end;
                       until ContractLines.Next=0;
                    end;
                    Message('Project Objective Updated Successfully');
                end;
            }
        }
    }

    var
        ContractLines: Record "Contract Funding Lines";
        GrantResearchObjct: Record "Grant Research Objectives";
}

