---
title: 'Test your Red Hat Enterprise Linux infrastructure code'
layout: lesson-overview
platform: Red Hat Enterprise Linux
logo: redhat.svg
order: 1
meta_tags: [{name: "ROBOTS", content: "NOINDEX, NOFOLLOW"}]
---
With Chef, you use _code_ to create cookbooks that express the desired state of your systems. You can also use code to verify that the cookbooks you write do what you expect.

This tutorial builds on the local development skills you've already learned and shows you how to test your infrastructure code to speed up development even more. Here's a quick recap of what you've learned so far:

* In [Develop your infrastructure code locally](/local-development/rhel/), you learned how _local development_ with Test Kitchen helps shorten the development process. With Test Kitchen, you apply your cookbook to a temporary instance that resembles production before you apply your work to a bootstrapped node.
* In [Manage a basic web application](/manage-a-web-app/rhel/), you built a basic but complete web application on Red Hat Enterprise Linux or CentOS called Customers that uses a web server, a database, and scripting. You used an iterative process to build and verify each part of the application on a local virtual machine using Test Kitchen.

Local development with Test Kitchen shortens the time it takes to bring up a machine and apply your Chef code. If you make a mistake or want to try something new, you can run your cookbook again or simply destroy the instance and create a new one.

<img src="/assets/images/networks/workstation-vm.png" style="width:30%; height:auto; box-shadow:none;" alt="Your workstation, Test Kitchen, and a virtual machine" />

One advantage to developing locally is that it enables you to confirm that `chef-client` completes successfully in your target environment. However, you still need to verify that your instance was configured as you expect. As your project gets more complex, making a small change to one component can affect the behavior of another.

For example, say you have a cookbook that configures a web application. A recipe in that cookbook configures a database server to listen on port 3306. You confirm that your configuration behaves as you expect. Later, another member of your team adds a recipe that configures the firewall and inadvertently closes access to port 3306. When you apply your configuration, your web application now displays a basic "access denied" error.

How would you diagnose the error? You might start by manually verifying that the database software is installed and running and that you can run basic queries. Or you might start by looking at other aspects of your configuration, such as user, group, and file permissions. It might take some time to discover that the firewall is blocking access to the required port. After you remedy the error, you may need to repeat the verification process to ensure that other functionality continues to work like you expect.

There are several ways to approach cookbook testing. Many Chef users take a _test-driven_ approach, where you write your tests first before you write any Chef code. With this approach, you write tests that initially fail and then write just enough code to make them pass. Other users have code they've already written and want to test or simply prefer to write their Chef code first. Both approaches are acceptable, and in this tutorial, you'll use both.

Rather than focusing on the [specific kinds of software testing](/skills/test-driven-development/), like unit and integration testing, in this tutorial we'll focus on these questions:

* Did our cookbook place the system in the desired state?
* Are our resources properly defined?
* Does the code adhere to our style guide?

After completing this tutorial, you should be able to:

* use [InSpec](https://docs.chef.io/inspec_reference.html) to verify that your cookbook configures the system as you expect.
* use [ChefSpec](https://docs.chef.io/chefspec.html) to verify that your resources are properly defined, even before you run your cookbook.
* use [RuboCop](https://docs.chef.io/rubocop.html) and [Foodcritic](https://docs.chef.io/foodcritic.html) to verify that your cookbook adheres to accepted coding standards and avoids common defects.

As optional exercises, the appendices show you how to use testing to validate code refactoring and how to write a _custom resource_ that includes test coverage.

You'll get started by ensuring that you're set up for local development.
