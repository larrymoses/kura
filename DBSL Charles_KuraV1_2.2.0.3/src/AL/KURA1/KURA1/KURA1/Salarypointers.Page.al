#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69023 "Salary pointers"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Salary Pointers";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Salary Scale";"Salary Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Pointer";"Salary Pointer")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin

                            if "Salary Pointer" = 'A' then
                              "Pointer Int" := 1
                            else if "Salary Pointer" = 'B' then
                              "Pointer Int" := 2
                            else if "Salary Pointer" = 'C' then
                              "Pointer Int" := 3
                            else if "Salary Pointer" = 'D' then
                              "Pointer Int" := 4
                            else if "Salary Pointer" = 'E' then
                              "Pointer Int" := 5
                            else if "Salary Pointer" = 'F' then
                              "Pointer Int" := 6
                            else if "Salary Pointer" = 'G' then
                              "Pointer Int" := 7
                            else if "Salary Pointer" = 'H' then
                              "Pointer Int" := 8
                            else if "Salary Pointer" = 'I' then
                              "Pointer Int" := 9
                            else if "Salary Pointer" = 'J' then
                              "Pointer Int" := 10
                            else if "Salary Pointer" = 'K' then
                              "Pointer Int" := 11
                            else if "Salary Pointer" = 'L' then
                              "Pointer Int" := 12
                            else if "Salary Pointer" = 'M' then
                              "Pointer Int" := 13
                            else if "Salary Pointer" = 'N' then
                              "Pointer Int" := 14
                            else if "Salary Pointer" = 'O' then
                              "Pointer Int" := 15
                            else if "Salary Pointer" = 'P' then
                              "Pointer Int" := 16;
                            //MODIFY;
                    end;
                }
                field("Basic Pay int";"Basic Pay int")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Basic Pay";"Basic Pay")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Pointer Int";"Pointer Int")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000007;Outlook)
            {
            }
            systempart(Control1000000008;Notes)
            {
            }
            systempart(Control1000000009;MyNotes)
            {
            }
            systempart(Control1000000010;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Generate Ascii")
            {
                ApplicationArea = Basic;
                Image = Allocate;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    SalaryPointers.Reset;
                    if SalaryPointers.Find('-') then begin
                      repeat
                        if SalaryPointers."Salary Pointer" = '1' then
                          SalaryPointers."Pointer Int" := 1
                        else if SalaryPointers."Salary Pointer" = '2' then
                          SalaryPointers."Pointer Int" := 2
                        else if SalaryPointers."Salary Pointer" = '3' then
                          SalaryPointers."Pointer Int" := 3
                        else if SalaryPointers."Salary Pointer" = '4' then
                          SalaryPointers."Pointer Int" := 4
                        else if SalaryPointers."Salary Pointer" = '5' then
                          SalaryPointers."Pointer Int" := 5
                        else if SalaryPointers."Salary Pointer" = '6' then
                          SalaryPointers."Pointer Int" := 6
                        else if SalaryPointers."Salary Pointer" = '7' then
                          SalaryPointers."Pointer Int" := 7
                        else if SalaryPointers."Salary Pointer" = '8' then
                          SalaryPointers."Pointer Int" := 8
                        else if SalaryPointers."Salary Pointer" = '9' then
                          SalaryPointers."Pointer Int" := 9
                        else if SalaryPointers."Salary Pointer" = '10' then
                          SalaryPointers."Pointer Int" := 10
                        else if SalaryPointers."Salary Pointer" = '11' then
                          SalaryPointers."Pointer Int" := 11
                        else if SalaryPointers."Salary Pointer" = '12' then
                          SalaryPointers."Pointer Int" := 12
                        else if SalaryPointers."Salary Pointer" = '13' then
                          SalaryPointers."Pointer Int" := 13
                        else if SalaryPointers."Salary Pointer" = '14' then
                          SalaryPointers."Pointer Int" := 14
                        else if SalaryPointers."Salary Pointer" = '15' then
                          SalaryPointers."Pointer Int" := 15
                        else if SalaryPointers."Salary Pointer" = '16' then
                          SalaryPointers."Pointer Int" := 16;
                        SalaryPointers.Modify;
                      until SalaryPointers.Next=0;
                    end;
                end;
            }
        }
    }

    var
        SalaryPointers: Record "Salary Pointers";
}

