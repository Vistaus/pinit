/*
 * SPDX-License-Identifier: GPL-3.0-or-later
 * SPDX-FileCopyrightText: 2021 Ryo Nakano <ryonakaknock3@gmail.com>
 */

public class CategoryChooser : Gtk.FlowBox {
    public signal void toggled ();

    public string selected {
        owned get {
            string _selected = "";
            foreach (var toggle in toggles) {
                if (toggle.active) {
                    _selected += "%s;".printf (toggle.category);
                }
            }

            return _selected;
        }
        set {
            string[] categories = value.split (";");
            foreach (var toggle in toggles) {
                toggle.active = false;

                foreach (var category in categories) {
                    if (toggle.category == category) {
                        toggle.active = true;
                        continue;
                    }
                }
            }
        }
    }

    private Gee.ArrayList<ToggleButton> toggles;
    private Gee.HashMap<string, string> categories;

    public CategoryChooser () {
        Object (
            hexpand: true,
            selection_mode: Gtk.SelectionMode.NONE,
            column_spacing: 6,
            row_spacing: 6
        );
    }

    construct {
        toggles = new Gee.ArrayList<ToggleButton> ();
        categories = new Gee.HashMap<string, string> ();

        categories.set ("AudioVideo", _("Audio & Video"));
        categories.set ("Audio", _("Audio"));
        categories.set ("Video", _("Video"));
        categories.set ("Development", _("Development"));
        categories.set ("Education", _("Education"));
        categories.set ("Game", _("Game"));
        categories.set ("Graphics", _("Graphics"));
        categories.set ("Network", _("Network"));
        categories.set ("Office", _("Office"));
        categories.set ("Science", _("Science"));
        categories.set ("Settings", _("Settings"));
        categories.set ("System", _("System"));
        categories.set ("Utility", _("Utility"));
        max_children_per_line = categories.size;

        int i = 0;
        foreach (var entry in categories.entries) {
            var toggle = new ToggleButton (entry.key, entry.value);
            toggle.get_style_context ().add_class ("category-toggle");
            toggle.toggled.connect (() => {
                toggled ();
            });
            toggles.add (toggle);
            insert (toggle, i);
            i++;
        }
    }

    public class ToggleButton : Gtk.ToggleButton {
        public string category { get; construct; }

        public ToggleButton (string category, string label) {
            Object (
                category: category,
                label: label
            );
        }
    }
}
