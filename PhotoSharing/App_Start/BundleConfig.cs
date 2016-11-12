using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Optimization;

namespace PhotoSharing
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                "~/Scripts/jquery.unobtrusive*",
                "~/Scripts/jquery.validate*"));

            bundles.Add(new ScriptBundle("~/bundles/knockout").Include(
                "~/Scripts/knockout-{version}.js",
                "~/Scripts/knockout.validation.js"));

            bundles.Add(new ScriptBundle("~/bundles/app").Include(
                "~/Scripts/sammy-{version}.js",
                "~/Scripts/app/common.js",
                "~/Scripts/app/app.datamodel.js",
                "~/Scripts/app/app.viewmodel.js",
                "~/Scripts/app/home.viewmodel.js",
                "~/Scripts/JS/jquery.custom-file-input.js",
                "~/Scripts/JS/custom-file-input.js",
                "~/Scripts/Lightbox/lightbox.js",
                "~/Scripts/app/_run.js"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                "~/Scripts/bootstrap.js",
                "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                 "~/Content/bootstrap.css",
                 "~/Content/datepicker.css",
                 "~/Content/Css/bundle-desktop-dp-main-f7d8952e.css",
                 "~/Content/Css/bundle-desktop-dp-modules-0-dbfe529a.css",
                 "~/Content/Css/bundle-desktop-dp-modules-1-3f8f9c24.css",
                 "~/Content/Css/bundle-desktop-dp-modules-2-22de1ddc.css",
                 "~/Content/Css/bundle-desktop-dp-modules-3-baf0a5d7.css",
                 "~/Scripts/lightbox/lightbox.css",
                 "~/Content/Css/component.css", "~/Content/Css/demo.css", "~/Content/Css/normalize.css",
                 "~/Content/Site.css"));
        }
    }
}
