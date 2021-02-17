pageextension 50052 Extend_ItemList_31 extends "Item List"
{
    layout
    {
        addafter("Unit Price")
        {
            field("Bag Style"; Rec."Bag Style")
            {
                ApplicationArea = All;
            }
            field("Film Structure"; Rec."Film Structure")
            {
                ApplicationArea = All;
            }
            field(Color; Rec.Color)
            {
                ApplicationArea = All;
            }
            field("Gusset Style"; Rec."Gusset Style")
            {
                ApplicationArea = All;
            }
            field("Barrier Level"; Rec."Barrier Level")
            {
                ApplicationArea = All;
            }
            field(Zipper; Rec.Zipper)
            {
                ApplicationArea = All;
            }
            field("Hang Hole"; Rec."Hang Hole")
            {
                ApplicationArea = All;
            }
            field(Window; Rec.Window)
            {
                ApplicationArea = All;
            }
            field("Fill Style"; Rec."Fill Style")
            {
                ApplicationArea = All;
            }
            field("Bag Width"; Rec."Bag Width")
            {
                ApplicationArea = All;
            }
            field("Bag Length"; Rec."Bag Length")
            {
                ApplicationArea = All;
            }
            field("Bag Gusset"; Rec."Bag Gusset")
            {
                ApplicationArea = All;
            }
            field("Bag Volume"; Rec."Bag Volume")
            {
                ApplicationArea = All;
            }
            field("Bag Weight"; Rec."Bag Weight")
            {
                ApplicationArea = All;
            }
            field("Bag Thickness"; Rec."Bag Thickness")
            {
                ApplicationArea = All;
            }
            field("Bag Tear Noth"; Rec."Bag Tear Notch")
            {
                ApplicationArea = All;
                Caption = 'Bag Tear Notch';
            }
        }
    }

    actions
    {
        addbefore("Item Journal")
        {
            action("Item Lot-Bin Info")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Lot-Bin Info';
                Image = Journals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Item Lot-Bin Info";
                RunPageLink = "Item No." = FIELD("No.");

            }
        }
    }

    var
        myInt: Integer;
}